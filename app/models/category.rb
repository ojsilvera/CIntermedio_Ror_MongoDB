# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
  has_many :tasks

  # valida que el campo este lleno
  validates :name, :description, presence: true

  # valida que distinga mayusculas de minusculas
  validates :name, uniqueness: { case_insensitive: false }
end
