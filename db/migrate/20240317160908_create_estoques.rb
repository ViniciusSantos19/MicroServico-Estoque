class CreateEstoques < ActiveRecord::Migration[7.1]
  def change
    create_table :estoques do |t|
      t.references :produto, null: false, foreign_key: true
      t.integer :quantidade
      t.date :data_entrada
      t.date :data_saida

      t.timestamps
    end
  end
end
