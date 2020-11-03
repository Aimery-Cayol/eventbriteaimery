require 'faker'
Faker::Config.locale = :fr

User.destroy_all

1.times do |index|
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name}.#{last_name}@yopmail.com",
        description: Faker::Lorem.paragraph,
    )
end