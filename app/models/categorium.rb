class Categorium < ApplicationRecord
  validates :nome, presence: true, length: { maximum: 55 }
  validates :descricao, presence: true, length: { maximum: 255 }

  # Valida se o nome é único
  validates :nome, uniqueness: true
end
