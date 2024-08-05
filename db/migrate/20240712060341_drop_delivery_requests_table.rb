class DropDeliveryRequestsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :delivery_requests
  end
end
