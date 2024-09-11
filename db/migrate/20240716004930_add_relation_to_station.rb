class AddRelationToStation < ActiveRecord::Migration[6.1]
  def change
    change_column :trains, :departure_station_id, :bigint
    change_column :trains, :arrival_station_id, :bigint
    add_foreign_key :trains, :stations, column: :departure_station_id
    add_foreign_key :trains, :stations, column: :arrival_station_id
  end
end
