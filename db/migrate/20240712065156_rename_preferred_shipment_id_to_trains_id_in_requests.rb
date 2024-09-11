class RenamePreferredShipmentIdToTrainsIdInRequests < ActiveRecord::Migration[6.1]
  def change
    remove_column :requests, :preferred_shipment, :string
  end
end
