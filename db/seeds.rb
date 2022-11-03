# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'test@test.com', password: 'password', password_confirmation: 'password') 
require 'csv'
require 'faker'

csvfile = File.read(Rails.root.join('lib', 'seeds', 'Employee_List.csv'))
table = CSV.parse(csvfile, headers: true)
table.each do |row|
    user = User.create!(
        email: row['email'],
        password: 'password',
    )
 
    Employee.create!(
        
        last_name: row['last_name'], 
        title: row['title'], 
        first_name: row['first_name'],
        email: row['email'],
        user: user 
    )

    AdminUser.create!(
        email: row['email'],
        password: 'password',
    )
end
    puts "//*******************Employee Table seeded*******************"

100.times do 
    Lead.create!(
        full_name: Faker::Name.name, 
        company_name: Faker::Company.name, 
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone,
        project_name: Faker::DcComics.hero,
        project_description: Faker::Hipster.sentence, 
        department_of_elevators: ["sales", "support", "admin"].sample, 
        message: Faker::Hipster.sentence, 
        attachment: "change to binary soon", 
        date_of_contact_request: Faker::Time.between(3.years.ago, Date.today)
        
    )
    end
puts "//***************Leads Table seeded with #{Lead.count} records*****************"

jsonfile = File.read(Rails.root.join('lib', 'seeds', 'addresses.json'))
data_hash = JSON.parse(jsonfile)
randomarray = Array.new(data_hash['addresses'].count - 1) {|e| e += 1};
arandom = randomarray.shuffle;
address_counter = 0;

(data_hash['addresses'].count-1).times do
    thisaddress = data_hash['addresses'][arandom[address_counter]]
    Address.create!(
        type_of_address: ["Home", "Business", "Shipping", "Billing"].sample, 
        status: ["verified", "unverified",].sample, 
        entity: ["Business", "Personal"].sample, 
        number_and_street: thisaddress["address1"], 
        suite_or_apartment: thisaddress["address2"], 
        city: thisaddress["city"], 
        postal_code: thisaddress["postalCode"], 
        country: "USA", 
        notes: Faker::Hipster.sentence

    ) 
    address_counter += 1
end
puts "//***************Address Table seeded with #{Address.count} records*****************"

record = Address.first.id 
counter = 0
20.times do
    user = User.create(
        email: Faker::Internet.email,
        password: 'password',
    )

    Customer.create!(
        user: user, 
        customer_creation_date: Faker::Date.between(3.years.ago, Date.today),
        company_name: (Faker::Company.name + Faker::Company.suffix),
        address_id: record + counter, 
        contact_full_name: Faker::Name.unique.name,
        company_contact_phone: Faker::PhoneNumber.cell_phone,
        company_contact_email: Faker::Internet.email,
        # company_description: Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
        service_tech_full_name: Faker::Name.unique.name,
        service_tech_phone: Faker::PhoneNumber.cell_phone,
        tech_manager_email: Faker::Internet.email
    )
    counter += 1
end
puts "//***************Customer Table seeded with #{Customer.count} records*****************"
Customer.all.each do |cust|

rand(1..2).times do
    Building.create!(
        customer: cust,
        address_id: record + counter,
        admin_full_name: Faker::Name.unique.name,
        admin_email: Faker::Internet.email,
        admin_phone: Faker::PhoneNumber.cell_phone,
        tech_contact_full_name: Faker::Name.unique.name,
        tech_contact_email: Faker::Internet.email,
        tech_contact_phone: Faker::PhoneNumber.cell_phone,
    )
    counter += 1
    end

end
puts "//***************Building Table seeded with #{Building.count} records*****************"

# 100.times do
#     Building_Detail.create!(
#         # building_id
#         # number_of_floors:
#         # building_type: 
#         architecture: ["Italianate", "Greek Revival", "Gothic Revival", "Modern", "Federal"].sample,
#         max_occupancy: rand().to_s,
#         construction_year: rand(1920..2020).to_s 

#     )  

# end
puts "//***************Building_Details Table seeded with #{Building_Detail.count} records*****************"

Battery.create!(
    
    building_type: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
    status: ["Running"],
    date_of_commission: Faker::Date.between(3.years.ago, Date.today),
    date_of_last_inspection: Faker::Date.between(2.years.ago, Date.today),
    # certificate_of_operations:

)

end



# puts "//***************Battery Table seeded with #{Battery.count} records*****************"


# Column.create!(

# )

# end
# puts "//***************Column Table seeded with #{Column.count} records*****************"

# Elevator.create!(

# )

# end
# puts "//***************Elevator Table seeded with #{Elevator.count} records*****************"


100.times do
    Quote.create!(
    
      building_type: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
      number_of_apartments: Faker::Number.between(from: 1, to: 15),
      number_of_floors: Faker::Number.between(from: 1, to: 20),
      number_of_basements: Faker::Number.between(from: 1, to: 5),
      number_of_companies: Faker::Number.between(from: 1, to: 10),
      number_of_parking_spots: Faker::Number.between(from: 10, to: 100),
      number_of_elevators: Faker::Number.between(from: 2, to: 20),
      number_of_corporations: Faker::Number.between(from: 1, to: 10),
      max_occupancy: Faker::Number.between(from: 6, to: 12),
      business_hours: Faker::Time.between(from: DateTime.now -1, to: DateTime.now),
      quality:["Standard", "Premium", "Excelium"].sample,
      elevator_amount: Faker::Number.between(from: 2, to: 20),
      elevator_unit_price: Faker::Number.decimal(l_digits: 2),
      elevator_total_price: Faker::Number.decimal(l_digits: 2),
      installation_fees: Faker::Number.decimal(l_digits: 2),
      final_price: Faker::Number.decimal(l_digits: 2),
    )
end
puts "//***************Quote Table seeded with #{Quote.count} records*****************"

