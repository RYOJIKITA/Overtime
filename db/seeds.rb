@user = User.create!(email: "test@gmail.com", password: "hogehoge", password_confirmation: "hogehoge", first_name: "jon", last_name: "dan")

puts "1 user created"

100.times do |post|
	Post.create(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"