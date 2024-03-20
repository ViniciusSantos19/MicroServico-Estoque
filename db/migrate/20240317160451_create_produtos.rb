class CreateProdutos < ActiveRecord::Migration[7.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.text :descricao
      t.integer :quantidade_em_estoque
      t.decimal :preco_de_custo
      t.decimal :preco_de_venda
      t.references :fornecedor, null: false, foreign_key: true
      t.references :categorium, null: false, foreign_key: true

      t.timestamps
    end
  end
end
