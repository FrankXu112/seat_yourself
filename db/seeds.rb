# puts "\nMaker Restaurant"
# 10.times do 
# 	Restaurant.create(
# 		name: Faker::Company.name,
# 		address: Faker::Address.street_address,
# 		phone: Faker::PhoneNumber.cell_phone,
# 		category_id: rand(2..7)
# 		)
# 	print "|"
# end

# puts "\nMaker User"
# 10.times do 
# 	User.create(
# 		name: Faker::Name.name,
# 		email: Faker::Internet.email,
# 		password: "123",
# 		password_confirmation: "123"
# 		)
# 	print "|"
# end

# puts "\nMaker Reservation"
# 10.times do 
# 	Reservation.create(
# 		seats: rand(2..10),
# 		time: Faker::Time.between(2.days.ago, Time.now),
# 		user_id: User.all.sample.id,
# 		restaurant_id: Restaurant.all.sample.id
# 		)
# 	print "|"
# end


# puts "\nMaker reviews ..."
# 10.times do 
# 	Review.create(
# 		comment: Faker::Hacker.say_something_smart,
# 		rating: rand(0..5),
# 		user_id: User.all.sample.id,
# 		restaurant_id: Restaurant.all.sample.id
# 		)
# 	print "|"
# end

Category.create(:name => "")
Category.create(:name => "Japanese")
Category.create(:name => "Chinese")
Category.create(:name => "Italian")
Category.create(:name => "Greek")
Category.create(:name => "Mexican")
Category.create(:name => "Korean")
Category.create(:name => "Canadian")
Category.create(:name => "French")

