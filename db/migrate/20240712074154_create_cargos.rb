class CreateCargos < ActiveRecord::Migration[6.1]
  def change
    create_table :cargos do |t|
      t.integer :capacity

      t.timestamps
    end
  end
end
