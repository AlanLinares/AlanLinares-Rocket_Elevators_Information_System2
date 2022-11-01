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
    Employee.create!(
        last_name: row['last_name'], 
        title: row['title'], 
        first_name: row['first_name'],
        email: row['email'], 
    )
    User.create(
        email: row['email'],
        password: 'password',
    )
    AdminUser.create(
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

