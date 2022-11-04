require 'pg'
require 'mysql2'
require 'faker'

def move_quote
Quote.all.each do |q|
    FactQuote.create!(
        {
            quote_id: q.id,
            #replace this creation with faker data going back 3 years
            creation: Faker::Time.between(3.years.ago, Date.today),
            # company_name: Faker::Company.name,
            email: Faker::Internet.email,
            nbElevator: q.number_of_elevators,
        }
    )
    end
end
move_quote()
puts "=== FactQuote imported #{FactQuote.count} ==="

def move_customer
    Customer.all.each do |c|
        elevator_number = 0
        c.buildings.all.each do |building|
            building.batteries.all.each do |battery|
                battery.columns.all.each do |column|
                    elevator_number += column.elevators.count 
                end
            end
        end
                
        DimCustomers.create!(
                {
                    creation_date: c.customer_creation_date,
                    company_name: c.company_name,
                    full_name_of_company_contact: c.contact_full_name,
                    email_of_company_contact: c.company_contact_email,
                    # todo ch nesting for nb_elevator
                    nb_elevators: elevator_number,
                    customer_city: c.company_address,
            
                }
            )
        end
end
move_customer()
puts "=== DimCustomers imported #{DimCustomers.count}==="


def move_lead
    Lead.all.each do |c|
        FactContact.create!(
            {
                # todo ch id's
                contact_id: c.id,
                creation_date: Faker::Time.between(3.years.ago, Date.today),
                company: c.company_name,
                email: c.email,
                project_name: c.project_name, 
            
            }
        )
        end
end
move_lead()
puts "=== FactContact imported #{FactContact.count}==="
def move_elevator
    Elevator.all.each do |ele|

        FactElevator.create!(
            {
                serial_number: ele.serial_numbers,
                date_of_commissioning: ele.date_of_commissioning,
                building_id: Battery.find(Column.find(ele.column_id).battery_id).building_id,
                customer_id: Building.find(Battery.find(Column.find(ele.column.id).battery_id).building_id).customer_id,
                building_city: Address.find(Building.find(Battery.find(Column.find(ele.column.id).battery_id).building_id).address_id).city,
            }
        )
    end
end
move_elevator()
puts "=== FactElevator imported #{FactElevator.count} ==="