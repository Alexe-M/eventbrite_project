# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Attendance.destroy_all
Event.destroy_all
User.destroy_all

10.times do |i|
  User.create(
    email: "user#{i + 1}@yopmail.com",
    encrypted_password: Faker::Internet.password(min_length: 8),
    description: Faker::Lorem.sentence,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end


10.times do 
  Event.create(
    start_date: Faker::Date.forward(days: rand(1..30)),
    duration: [30, 60, 90, 120].sample,
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 5),
    price: rand(1..1000),
    location: Faker::Address.city
  )

end


20.times do 
  Attendance.create(
    stripe_customer_id: Faker::Alphanumeric.alpha(number: 10),
    user: User.all.sample,
    event: Event.all.sample
  )
end




