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

# 1. Clean the database 🗑️
puts "Cleaning database..."
Viewing.destroy_all

# 2. Create the instances 🏗️
puts "Creating viewings..."
Viewing.create!(title: Faker::Movie.title, category: "movie")
puts "Created Viewings"
Viewing.create!(title: Faker::Movie.title, category: "serie")
puts "Created Viewings"

# 3. Display a message 🎉
puts "Finished! Created #{Viewing.count} viewings."
