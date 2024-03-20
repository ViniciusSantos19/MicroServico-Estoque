class Servico < ApplicationRecord
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
