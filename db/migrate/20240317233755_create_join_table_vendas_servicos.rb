class CreateJoinTableVendasServicos < ActiveRecord::Migration[7.1]
  def change
    create_join_table :vendas, :servicos
  end
end
