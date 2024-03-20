class Fornecedor < ApplicationRecord
  validates :nome, presence: true, length: { maximum: 55 }
  validates :cnpj, uniqueness: true, length: { is: 14 }, presence: true
  validates :endereco, presence: true, format: { with: /\A[a-zA-Z0-9 ,]+\z/ }, length: { maximum: 300 }
  validates :email, uniqueness: true, format: { with: %r{\A[a-zA-Z0-9!#$%&'*+\-/=?^_`{|}~.@ ]+\z} }
  validates :telefone, format: { with: /\A[0-9]+\z/ }, length: { is: 11 }
end
