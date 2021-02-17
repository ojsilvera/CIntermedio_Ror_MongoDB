# spec/models/task_spec.rb
require 'rails_helper'

RSpec.describe Task, type: :model do
  # * test document and timeStamps present
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }

  # * it have to fields with your type
  it { is_expected.to have_field(:name).of_type(String) }
  it { is_expected.to have_field(:description).of_type(String) }
  it { is_expected.to have_field(:due_date).of_type(Date) }
  it { is_expected.to have_field(:code).of_type(String) }

  # * validate relations
  it { is_expected.to belong_to(:category) }
  it { is_expected.to belong_to(:owner) }
  it { is_expected.to have_many(:participating_users) }
  it { is_expected.to have_many(:notes) }

  # * it have to validates fields
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:due_date) }
  it { is_expected.to validate_presence_of(:participating_users) }

  # * this fields is unique in that model
  it { is_expected.to validate_uniqueness_of(:name) }

  describe '#save' do
    context 'with params from scracth' do
      # * uso las factories para crear los elementos requeridos por la tarea
      let(:owner) { create :user }
      let(:category) { create :category }
      let(:participant1) { build :participant, :responsible }
      let(:participant2) { build :participant, :follower }

      # * el sujeto crea una nueva tarea
      subject(:task) do
        described_class.new(
          name: 'Test task',
          description: 'Test Body',
          due_date: Date.today + 5.days,
          category: category,
          owner: owner,
          participating_users: [participant1, participant2]
        )
      end
      # * espero que la tarea sea valida desde la ejecucion del sujeto
      it { is_expected.to be_valid }

      # * contexto para despues de grabar el registro en la base de datos
      context 'after save' do
        before(:each) { task.save }
        it { is_expected.to be_persisted }
        it 'has a computed code' do
          expect(task.code).to be_present
        end
      end
      # * contexto para fecha ubicada en el pasado
      context 'we due_date in the past' do
        subject { task.tap { |t| t.due_date = Date.today - 1.day } }
        # * prueba no valida, no debe pasar el test
        it { is_expected.to_not be_valid }
      end

    end

    context 'factorBot with params' do
      let(:participants_count) { 4 }
      subject(:task) { build(:task_with_participants, participants_count: participants_count) }
      it 'is persisted' do
        expect(task.save).to eq true
      end
      context 'after save' do
        before(:each) { task.save }
        it 'has all associated participants' do
          expect(task.participating_users.count).to eq participants_count
          expect(Participant.count).to eq participants_count
        end
      end
    end
  end
end
