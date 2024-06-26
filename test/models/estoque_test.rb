require 'test_helper'

class EstoqueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  test 'deve ser inválido sem quantidade' do
    estoque = Estoque.new(data_entrada: Date.today, data_saida: Date.tomorrow)
    assert_not estoque.valid?
    assert_includes estoque.errors.full_messages, "Quantidade can't be blank"
  end

  test 'deve ser inválido sem data de entrada' do
    estoque = Estoque.new(quantidade: 10, data_saida: Date.tomorrow)
    assert_not estoque.valid?
    assert_includes estoque.errors.full_messages, "Data entrada can't be blank"
  end

  test 'deve ser inválido sem data de saída' do
    estoque = Estoque.new(quantidade: 10, data_entrada: Date.today)
    assert_not estoque.valid?
    assert_includes estoque.errors.full_messages, "Data saida can't be blank"
  end
end
