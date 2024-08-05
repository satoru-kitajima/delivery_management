class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.datetime :delivery_date
      t.integer :package_size
      t.integer :quantity
      t.string :preferred_shipment
      t.string :delivery_type
      t.boolean :pickup_required
      t.boolean :delivery_required
      t.string :status

      t.timestamps
    end
  end
end
