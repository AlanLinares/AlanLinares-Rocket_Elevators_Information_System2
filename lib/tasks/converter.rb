require 'pg'
require 'mysql2'
require 'faker'

def move_quote
    Quote.all.each do |q|
    FactQuote.create!(
            {
                quote_id: q.id,
                creation: q.created_at,
                # company_name: Faker::Company.name,
                email: Faker::Internet.email,
                nbElevator: q.number_of_elevators,
            }
        )
    end
end
move_quote()
puts "=== FactQuote imported ==="

# def move_customer
#     Customer.all.each do |c|
#         DimCustomers.create!(
#             creation_date: c.created_at,
#             company_name: c.company_name,
#             full_name_of_company_contact: c.contact_full_name,
#             email_of_company_contact: c.company_contact_email,
#             # nb_elevators: 
#             customer_city: c.address_id
#         )
#     end
# end
# puts "=== DimCustomer imported ==="

# def move_elevator
#     Elevator.all.each do |e|
#         FactElevator.create!(
#             serial_number: e.serial_numbers,
#             date_of_commissioning: e.date_of_commissioning,
#             # building_id:
#             # customer_id
#             # building_city
#         )
#     end
# end
# puts "=== FactElevator imported ==="


# def move_contacts
#     Leads.all.each do |le|
#         FactContacts.create!(
#             contact_id: le.id,
#             creation_date: le.created_at,
#             company: le.company_name,
#             email: le.email,
#             project_name: le.project_name
#         )
#     end
# end
# puts "=== FactContacts imported ==="













