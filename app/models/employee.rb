class Employee < ApplicationRecord
    has_many :battery
    belong_to :users
end
