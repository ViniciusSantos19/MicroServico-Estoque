class CreateVendas < ActiveRecord::Migration[7.1]
  def change
    create_table :vendas do |t|
      t.date :data
      t.time :hora
      t.decimal :valor_total
      t.string :forma_pagamento
      t.timestamps
    end
  end
end
