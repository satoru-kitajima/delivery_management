class AddForeginKeys < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :pickup_id, :bigint
    add_column :requests, :dropoff_id, :bigint
    add_column :requests, :user_id, :bigint
    add_column :requests, :preferred_shipment, :bigint

    add_column :handlers, :train_id, :bigint
    add_column :handlers, :station_id, :bigint

    add_column :packages, :item_id, :bigint
    add_column :packages, :request_id, :bigint


    add_foreign_key :handlers, :stations, column: :station_id
    add_foreign_key :handlers, :trains, column: :train_id

    add_foreign_key :requests, :users, column: :user_id
    add_foreign_key :requests, :pickups, column: :pickup_id
    add_foreign_key :requests, :dropoffs, column: :dropoff_id

    add_foreign_key :packages, :items, column: :item_id
    add_foreign_key :packages, :requests, column: :request_id

    add_foreign_key :cancels, :requests, column: :request_id

    add_foreign_key :handler_requests, :stations, column: :station_id

    add_foreign_key :bring_times, :requests, column: :request_id
  end
end
