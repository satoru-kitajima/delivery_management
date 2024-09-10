class Station < ApplicationRecord
    has_many :departing_trains, class_name: 'Train', foreign_key: :departure_station_id
    has_many :arriving_trains, class_name: 'Train', foreign_key: :arrival_station_id  
end
