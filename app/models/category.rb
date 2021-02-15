class Category
  include Mongoid::Document
  include Mongoid::Timestamps

  # Definiendo los campos del modelo bajo la premisa nonSql
  field :name, type: String
  field :description, type: String

  # Relacion task >- category
  has_many :tasks

  # valida que el campo este lleno
  validates :name, :description, presence: true

  # valida que distinga mayusculas de minusculas
  validates :name, uniqueness: { case_insensitive: false }
end
