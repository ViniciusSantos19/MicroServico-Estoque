class Produto < ApplicationRecord
  belongs_to :fornecedor
  belongs_to :categorium
  has_and_belongs_to_many :servicos
end
