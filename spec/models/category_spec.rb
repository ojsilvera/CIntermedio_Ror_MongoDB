require 'rails_helper'

RSpec.describe Category, type: :model do
  # test document and timeStamps present
  it { is_expected.to be_mongoid_document }
  it { is_expected.to have_timestamps }
  # test fields
  it { is_expected.to have_field(:name).of_type(String) }
  it { is_expected.to have_field(:description).of_type(String) }
  # validate relations
  it { is_expected.to have_many(:tasks) }
  # it have to validates for unique field name
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
