class RemoveProdutoIdFromServico < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :produto, if_exists: true
  end
end
