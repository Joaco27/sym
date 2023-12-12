# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


reg = Category.create!(:name => "Regular")
temp = Category.create!(:name => "Temporal")
priv = Category.create!(:name => "Privado")
eph = Category.create!(:name => "Efimero")

u = User.create!(username: 'Joaco27', email: 'joaco200127@gmail.com', password: 'hola123')

l = Link.create!(user_id: 1, original_link: 'https://github.com/Joaco27/sym', category: 'Regular')
