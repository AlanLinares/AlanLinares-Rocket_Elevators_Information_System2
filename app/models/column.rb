class Column < ApplicationRecord
    belong_to: battery
    has_many: elevators
end
