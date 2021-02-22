class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  # * Definiendo los campos del modelo bajo la premisa nonSql
  field :name, type: String
  field :description, type: String
  field :due_date, type: Date
  field :code, type: String

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
    Tasks::SendEmail.new.call self
  end
end
