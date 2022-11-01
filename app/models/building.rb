class Building < ApplicationRecord
    belong_to :address
    has_many :battery
end
