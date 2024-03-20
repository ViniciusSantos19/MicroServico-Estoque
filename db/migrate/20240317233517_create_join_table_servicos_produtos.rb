class CreateJoinTableServicosProdutos < ActiveRecord::Migration[7.1]
  def change
    create_join_table :servicos, :produtos
  end
end
# novo
