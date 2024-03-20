class Estoque < ApplicationRecord
  validates :quantidade, presence: true, numericality: { greater_than: 0 }
  validates :data_entrada, :data_saida, presence: true
  validate :data_entrada_menor_que_data_saida, if: -> { data_entrada.present? && data_saida.present? }

  belongs_to :produto

  def data_entrada_menor_que_data_saida
    errors.add(:data_entrada, 'deve ser menor que a data de saída') if data_entrada >= data_saida
  end
end
