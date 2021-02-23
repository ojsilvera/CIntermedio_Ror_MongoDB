class Task
  include Mongoid::Document
  include Mongoid::Timestamps
  include AASM

  # * Definiendo los campos del modelo bajo la premisa nonSql
  field :name, type: String
  field :description, type: String
  field :due_date, type: Date
  field :code, type: String
  field :status, type: String
  field :transitions, type: Array, default: []

  # * Relaciones
  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_many :participating_users, class_name: 'Participant', dependent: :delete_all
  # has_many :participants, through: :participating_users, source: :user
  has_many :notes

  # * Validaciones
  validates :name, :description, :due_date, presence: true
  validates :participating_users, presence: true
  validates :name, uniqueness: { case_insensitive: false }
  validate :due_date_validate

  # * Generar codigo para la tarea
  before_create :create_code

  # * enviar email, una vez creada la tarea
  after_create :send_mail

  # * Permitir insercion de campos de un modelo en el formulario de otro a traves de la gema cocoon
  accepts_nested_attributes_for :participating_users, allow_destroy: true


  # * Maquina de estados gema AASM
  aasm column: :status do
    state :pending, initial: true
    state :in_process, :finished

    after_all_transitions :audit_status_change

    event :start do
      transitions from: :pending, to: :in_process
    end

    event :finish do
      transitions from: :in_process, to: :finished
    end
  end

  # * metodo correspondiente al proceso de auditado de la maquina de estados
  # * permite persistir las salidas del proceso de auditoria
  def audit_status_change
    set transitions: transitions.push(
      from_state: aasm.from_state,
      to_state: aasm.to_state,
      current_event: aasm.current_event,
      timestamp: Time.zone.now
    )
  end

  def participants
    participating_users.includes(:user).map(&:user)
  end

  def due_date_validate
    return if due_date.blank?
    return if due_date > Date.today

    errors.add :due_date, I18n.t('task.errors.invalid_due_date')
  end

  def create_code
    self.code = "#{owner_id}#{Time.now.to_i.to_s(36)}#{SecureRandom.hex(8)}"
  end

  def send_mail
    # return unless Rails.env.development
    return
    Tasks::SendEmailJob.perfom_async id.to_s
  end
end
