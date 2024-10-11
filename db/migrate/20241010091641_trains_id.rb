class TrainsId < ActiveRecord::Migration[6.1]
  def change
    rename_column :requests, :preferred_shipment_id, :trains_id
  end
end
