class CreateHandlers < ActiveRecord::Migration[6.1]
  def change
    create_table :handlers do |t|
      t.integer :capacity

      t.timestamps
    end
  end
end
