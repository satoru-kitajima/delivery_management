class Train < ApplicationRecord
    has_many :requests, foreign_key: :trains_id 
    has_many :handler
    has_many :handler_request
    has_one :cargo
    belongs_to :departure_station, class_name: 'Station', foreign_key: :departure_station_id, optional: true
    belongs_to :arrival_station, class_name: 'Station', foreign_key: :arrival_station_id, optional: true
  
end
