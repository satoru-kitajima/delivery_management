class CreateDeliveryRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_requests do |t|
      t.string :customer_name
      t.string :delivery_address
      t.datetime :requested_delivery_time
      t.string :status

      t.timestamps
    end
  end
end
