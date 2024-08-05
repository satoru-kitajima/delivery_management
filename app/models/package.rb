class Package < ApplicationRecord
    belongs_to :item, optional:true
    belongs_to :request, optional:true
end
