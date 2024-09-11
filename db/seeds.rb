# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'

CSV.foreach(Rails.root.join('db/seeds/cargos.csv'), headers: true) do |row|
  Cargo.find_or_create_by!({
    id: row['id'],
    capacity: row['capacity']
  })
end

CSV.foreach(Rails.root.join('db/seeds/items.csv'), headers: true) do |row|
  Item.find_or_create_by!({
    id: row['id'],
    name: row['name']
  })
end

CSV.foreach(Rails.root.join('db/seeds/station.csv'), headers: true) do |row|
  Station.find_or_create_by!({
    id: row['id'],
    name: row['name']
  })
end

CSV.foreach(Rails.root.join('db/seeds/trains.csv'), headers: true) do |row|
  Train.find_or_create_by!({
    id: row['id'],
    name: row['name'],
    cargo_id: row['cargo_id'],
    departure_station_id: row['departure_station_id'],
    arrival_station_id: row['arrival_station_id'],
    reception_start_time: row['reception_start_time'],
    extradition_start_time: row['extradition_start_time']
  })
end