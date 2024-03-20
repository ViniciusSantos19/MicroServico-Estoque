class RemoveProdutoReference < ActiveRecord::Migration[7.1]
  def change
    remove_column :servicos, :produto_id
  end
end
