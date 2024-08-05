class CreatePackages < ActiveRecord::Migration[6.1]
  def change
    create_table :packages do |t|
      t.integer :size
      t.integer :quantity

      t.timestamps
    end
  end
end
