class Building < ApplicationRecord
    belong_to :address
    has_many :battery
    has_one :building_details
end
