class CreateServicos < ActiveRecord::Migration[7.1]
  def change
    create_table :servicos do |t|
      t.string :nome
      t.text :descricao
      t.integer :duracao
      t.decimal :preco
      t.references :produto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
