class AddRelationToStation < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :trains, :stations, column: :departure_station_id
    add_foreign_key :trains, :stations, column: :arrival_station_id
  end
end
