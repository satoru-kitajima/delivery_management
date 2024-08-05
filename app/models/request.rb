class Request < ApplicationRecord
    belongs_to :train, foreign_key: :trains_id, optional: true
    belongs_to :user, foreign_key: :user_id, optional: true
    belongs_to :pickup, foreign_key: :pickup_id, optional: true
    belongs_to :dropoff, foreign_key: :dropoff_id, optional: true

    has_one :bring_times
    has_one :cancel

    has_many :packages, dependent: :destroy
    accepts_nested_attributes_for :packages

end
