class CreateTrains < ActiveRecord::Migration[6.1]
  def change
    create_table :m_trains do |t|
      t.string :name
      t.integer :cargo_id
      t.integer :departure_station_id
      t.integer :arrival_station_id
      t.datetime :reception_start_time
      t.datetime :extradition_start_time

      t.timestamps
    end
  end
end
