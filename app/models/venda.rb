class Venda < ApplicationRecord
  has_and_belongs_to_many :servicos
end
