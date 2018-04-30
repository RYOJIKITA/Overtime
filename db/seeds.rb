@user = User.create!(email: "hoge@gmail.com", 
										 password: "hogehoge", 
										 password_confirmation: "hogehoge", 
										 first_name: "jon", 
										 last_name: "snow",
										 phone: '815031344450' )

puts "1 user created"

AdminUser.create!(email: "admin@gmail.com", 
								  password: "hogehoge", 
								  password_confirmation: "hogehoge", 
								  first_name: "Mat", 
								  last_name: "wise",
								  phone: '815031344450' )

puts "1 admin created"

100.times do |post|
	Post.create(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts "100 Posts have been created"