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
