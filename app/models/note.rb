class Noteinclude
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: string

  belongs_to :user
  belongs_to :task

  validates :body, presence: true
end
