class Address < ApplicationRecord
    has_one :building
    has_one :customer

    # accepts_nested_attributes_for :building, :customer
end
