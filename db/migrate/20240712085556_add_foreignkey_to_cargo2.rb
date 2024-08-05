class AddForeignkeyToCargo2 < ActiveRecord::Migration[6.1]
  def change
    add_column :cargos, :train_id, :bigint
    add_index :cargos, :train_id
    add_foreign_key :cargos, :trains   
  end
end
