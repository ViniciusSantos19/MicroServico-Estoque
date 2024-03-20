require 'test_helper'

class FornecedorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # Validação de Nome
  test 'deve ser inválido sem nome' do
    fornecedor = Fornecedor.new(cnpj: '12345678901234', endereco: 'Rua da Paz, 123', email: 'fornecedor@email.com',
                                telefone: '11987654321')
    assert_not fornecedor.valid?
    assert_includes fornecedor.errors.full_messages, "Nome can't be blank"
  end

  test 'deve ser válido com nome preenchido' do
    fornecedor = Fornecedor.new(nome: 'Fornecedor LTDA', cnpj: '12345678901234', endereco: 'Rua da Paz, 123',
                                email: 'fornecedor@email.com', telefone: '11987654321')
    assert fornecedor.valid?
  end

  test 'deve ser inválido com nome excedendo o tamanho limite' do
    nome_longo = 'A' * 56
    fornecedor = Fornecedor.new(nome: nome_longo, cnpj: '12345678901234', endereco: 'Rua da Paz, 123',
                                email: 'fornecedor@email.com', telefone: '11987654321')
    assert_not fornecedor.valid?
    assert_includes fornecedor.errors.full_messages, 'Nome is too long (maximum is 55 characters)'
  end

  test 'deve ser inválido sem CNPJ' do
    fornecedor = Fornecedor.new(nome: 'Outro Fornecedor LTDA',
                                endereco: 'Rua da Liberdade 456', email: 'fornecedor@gmail',
                                telefone: '12345678911')
    assert_not fornecedor.valid?
    assert_includes fornecedor.errors.full_messages, "Cnpj can't be blank"
  end

  test 'deve ser válido com CNPJ válido' do
    fornecedor = Fornecedor.new(nome: 'Fornecedor LTDA', cnpj: '11234567810111', endereco: 'Rua da Paz, 123',
                                email: 'fornecedor1@email.com', telefone: '12345678912')
    assert fornecedor.valid?
  end

  test 'deve ser inválido com CNPJ com tamanho diferente de 14 caracteres' do
    fornecedor = Fornecedor.new(nome: 'Fornecedor LTDA', cnpj: '1234567890123', endereco: 'Rua da Paz, 123',
                                email: 'fornecedor@email.com', telefone: '12345678912')
    assert_not fornecedor.valid?
    assert_includes fornecedor.errors.full_messages, 'Cnpj is the wrong length (should be 14 characters)'
  end

  test 'deve ser inválido sem endereço' do
    fornecedor = Fornecedor.new(nome: 'Fornecedor LTDA', cnpj: '12345678901234', email: 'fornecedor@email.com',
                                telefone: '11987654321')
    assert_not fornecedor.valid?
    assert_includes fornecedor.errors.full_messages, "Endereco can't be blank"
  end

  test 'deve ser válido com endereço preenchido' do
    fornecedor = Fornecedor.new(nome: 'Fornecedor LTDA', cnpj: '12345678901234', endereco: 'Rua da Paz, 123',
                                email: 'fornecedor@email.com', telefone: '11987654321')
    assert fornecedor.valid?
  end
end
