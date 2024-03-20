require 'test_helper'

class CategoriumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'valid to create' do
    categoria = Categorium.new
    assert_not categoria.valid?
  end

  test 'is valid with valid attributes' do
    categoria = Categorium.new(nome: 'Categoria 1', descricao: 'Descrição da categoria')
    assert categoria.valid?
  end

  test 'is not valid without a nome' do
    categoria = Categorium.new(descricao: 'Descrição da categoria')
    assert_not categoria.valid?
  end

  test 'is not valid to create withou description' do
    categoria = Categorium.new(nome: 'categoria 2')
    assert_not categoria.valid?
  end

  test 'is not valid to create without name' do
    categoria = Categorium.new(descricao: 'descricao categoria')
    assert_not categoira.valid?
  end
end
