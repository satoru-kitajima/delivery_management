class User < ApplicationRecord
    has_many :requests, foreign_key: :user_id 
    has_secure_password

end
