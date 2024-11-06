# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb

# db/seeds.rb
# db/seeds.rb

# db/seeds.rb

# Suppression des participations et événements existants
Attendance.destroy_all
Event.destroy_all
User.destroy_all

# Création d'utilisateurs
users = User.create!([
  { email: 'user1@example.com', password: 'password', first_name: 'John', last_name: 'Doe', description: 'Organizer' },
  { email: 'user2@example.com', password: 'password', first_name: 'Jane', last_name: 'Smith', description: 'Participant' },
  { email: 'user3@example.com', password: 'password', first_name: 'Alice', last_name: 'Johnson', description: 'Participant' },
  { email: 'user4@example.com', password: 'password', first_name: 'Bob', last_name: 'Williams', description: 'Participant' },
  { email: 'user5@example.com', password: 'password', first_name: 'Charlie', last_name: 'Brown', description: 'Organizer' }
])

# Création d'événements
events = Event.create!([
  { title: 'Concert de Jazz', description: 'Un concert de jazz incroyable.', start_date: Time.now + 1.day, duration: 120, price: 50, location: 'Paris', user: users[0] },
  { title: 'Atelier de Cuisine', description: 'Apprenez à cuisiner avec des chefs.', start_date: Time.now + 2.days, duration: 90, price: 75, location: 'Lyon', user: users[4] },
  { title: 'Conférence Tech', description: 'Discussion sur les nouvelles technologies.', start_date: Time.now + 3.days, duration: 180, price: 100, location: 'Marseille', user: users[0] }
])

# Création de participations
Attendance.create!([
  { stripe_customer_id: Faker::Alphanumeric.alpha(number: 10), user: users[1], event: events[0] },
  { stripe_customer_id: Faker::Alphanumeric.alpha(number: 10), user: users[2], event: events[0] },
  { stripe_customer_id: Faker::Alphanumeric.alpha(number: 10), user: users[3], event: events[1] },
  { stripe_customer_id: Faker::Alphanumeric.alpha(number: 10), user: users[1], event: events[2] }
])

puts "Seed finished! Created #{User.count} users, #{Event.count} events, and #{Attendance.count} attendances."
