class AddPreferredShipmentReferenceToTRequests < ActiveRecord::Migration[6.1]
  def change
    add_reference :requests, :preferred_shipment, foreign_key: { to_table: :m_trains }
  end
end
