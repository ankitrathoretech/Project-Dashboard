# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

puts "Clearing old data..."
Project.destroy_all
Category.destroy_all
User.destroy_all

puts "Creating categories..."
categories = 5.times.map do
  Category.create!(name: Faker::Commerce.department(max: 1))
end

puts "Creating users..."
users = 10.times.map do |i|
  salt = SecureRandom.hex(4)
  password = 'password123'
  encrypted = Digest::MD5.hexdigest(Digest::MD5.hexdigest(password) + salt)

  User.create!(
    username: "user#{i + 1}",
    email: "user#{i + 1}@example.com",
    salt: salt,
    encrypted_password: encrypted
  )
end

puts "Creating projects..."
50.times do |i|
  Project.create!(
    title: "Project #{i + 1}",
    user: users.sample,
    category: categories.sample,
    created_at: Faker::Date.backward(days: 90)
  )
end

puts "✅ Seeding complete!"
