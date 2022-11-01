class Battery < ApplicationRecord
    has_many :column
    belong_to :building
    belong_to :employee
end
