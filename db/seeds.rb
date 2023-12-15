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

u = User.create!(username: 'Joaco27', email: 'joaco@mail.com', password: 'hola123')

l_reg = Link.create!(user_id: 1, original_link: 'https://github.com/Joaco27/sym', category: 'Regular')
l_priv = Link.create!(user_id: 1, original_link: 'https://github.com/Joaco27/sym/tree/master/storage', category: 'Privado', password:"12345")
l_eph = Link.create!(user_id: 1, original_link: 'https://github.com/Joaco27/sym/tree/master/app', category: 'Efimero')
l_temp = Link.create!(user_id: 1, original_link: 'https://github.com/Joaco27/sym/tree/master/config', category: 'Temporal', expiration: Time.now + 2.day)
l_temp_exp = Link.create!(user_id: 1, original_link: 'https://github.com/Joaco27/sym/tree/master/public', category: 'Temporal', expiration: Time.now - 2.day)

random_access1 = Access.create!(link_id: 1, ip: "80.58.0.33")
random_access1.created_at = DateTime.now - 1.week
random_access1.save!

random_access2 = Access.create!(link_id: 1, ip: "255.255.255.0")
random_access2.created_at = DateTime.now - 1.day
random_access2.save!

random_access3 = Access.create!(link_id: 1, ip: "192.168.1.13")
random_access3.created_at = DateTime.now
random_access3.save!
