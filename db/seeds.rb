require 'faker'
Faker::Config.locale = :fr

User.destroy_all

5.times do |i|
    User.create(email: "prenom.nom#{i + 1}@yopmail.com", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end


5.times do
    Event.create(start_date: Faker::Date.forward, duration: rand(1..60)*5, title: Faker::Movie.quote, description: Faker::Lorem.sentence(word_count: 12), price: rand(1..1000), location: Faker::Address.full_address)
  end


  #title: Faker::Lorem.sentence(word_count: 5)