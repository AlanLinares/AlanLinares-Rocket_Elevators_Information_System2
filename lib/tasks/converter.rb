require 'pg'
require 'mysql2'
# def move_quote
Quote.all.each do |q|
    FactQuote.create!(
        {
            quote_id: q.id,
            creation: q.date_created,
            company_name: Faker::Company.name,
            email: Faker::Internet.email,
            nbElevator: q.number_of_elevators,
        }
    )
end
# end
# move_quote()
puts "=== FactQuote imported ==="

    Customer.all.each do |c|
    DimCustomers.create!(
            {
                creation_date: c.date_created,
                company_name: Faker::Company.name,
                full_name_of_company_contact: Faker::Name.name,
                email_of_company_contact: Faker::Internet.email,
                # todo ch nesting for nb_elevators
                nb_elevators: customers.number_of_elevators,
                customer_city:Faker::Address.city,
           
            }
        )
    end
end
puts "=== DimCustomers imported ==="

Contact.all.each do |c|
    FactContact.create!(
        {
            # todo ch id's
            contact_id: c.id,
            creation_date:c.creation_date,
            company: Faker::Company.name,
            email:Faker::Internet.email,
            project_name:Faker::Company.name, 
        
        }
    )
    end
end
puts "=== FactContact imported ==="

Elevator.all.each do |e|
    FactElevator.create!(
        {
            serial_number: e.serial_numbers,
            date_of_commissioning: e.date_of_commissioning,
            building_id: e.building_id,
            customer_id: e.customer_id,
            building_city: Faker::Address.city,
        }
    )
    end
end
puts "=== FactElevator imported ==="

