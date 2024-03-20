class Servico < ApplicationRecord
  validates :nome, presence: true, length: { maximum: 55 }
  validates :descricao, presence: true, length: { maximum: 255 }
  validates :preco, :duracao, presence: true, numericality: { greater_than: 0 }

  attr_accessor :nome, :descricao, :duracao, :preco

  has_and_belongs_to_many :produtos
  has_and_belongs_to_many :venda

  def total_value
    servicos = Servico.all
    servicos.reduce(0) do |sum, servico|
      sum + servico.preco
    end
  end
end
