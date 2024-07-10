# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_318_011_626) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categoria', force: :cascade do |t|
    t.string 'nome'
    t.text 'descricao'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'estoques', force: :cascade do |t|
    t.bigint 'produto_id', null: false
    t.integer 'quantidade'
    t.date 'data_entrada'
    t.date 'data_saida'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['produto_id'], name: 'index_estoques_on_produto_id'
  end

  create_table 'fornecedors', force: :cascade do |t|
    t.string 'nome'
    t.string 'cnpj'
    t.string 'endereco'
    t.string 'telefone'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'produtos', force: :cascade do |t|
    t.string 'nome'
    t.text 'descricao'
    t.integer 'quantidade_em_estoque'
    t.decimal 'preco_de_custo'
    t.decimal 'preco_de_venda'
    t.bigint 'fornecedor_id', null: false
    t.bigint 'categorium_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['categorium_id'], name: 'index_produtos_on_categorium_id'
    t.index ['fornecedor_id'], name: 'index_produtos_on_fornecedor_id'
  end

  create_table 'produtos_servicos', id: false, force: :cascade do |t|
    t.bigint 'servico_id', null: false
    t.bigint 'produto_id', null: false
  end

  create_table 'servicos', force: :cascade do |t|
    t.string 'nome'
    t.text 'descricao'
    t.integer 'duracao'
    t.decimal 'preco'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'servicos_vendas', id: false, force: :cascade do |t|
    t.bigint 'venda_id', null: false
    t.bigint 'servico_id', null: false
  end

  create_table 'vendas', force: :cascade do |t|
    t.date 'data'
    t.time 'hora'
    t.decimal 'valor_total'
    t.string 'forma_pagamento'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'estoques', 'produtos'
  add_foreign_key 'produtos', 'categoria'
  add_foreign_key 'produtos', 'fornecedors'
end
