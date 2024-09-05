class Package < ApplicationRecord    
    belongs_to :item, optional:true
    belongs_to :request, optional:true

    validates :size, presence: true
    validates :quantity, presence: true
end
