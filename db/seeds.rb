@user = User.create!(email: "hoge@gmail.com", 
										 password: "hogehoge", 
										 password_confirmation: "hogehoge", 
										 first_name: "jon", 
										 last_name: "snow",
										 phone: '5555555555' )

puts "1 user created"

AdminUser.create!(email: "admin@gmail.com", 
								  password: "hogehoge", 
								  password_confirmation: "hogehoge", 
								  first_name: "Mat", 
								  last_name: "wise",
								  phone: '5555555555' )

puts "1 admin created"

100.times do |post|
	Post.create(date: Date.today, rationale: "#{post} rationale content Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user_id: @user.id, overtime_request: 2.5)
end

puts "100 Posts have been created"

100.times do |audit_log|
	AuditLog.create(user_id: @user.id, status: 0, start_date: (Date.today - 6.days))
end

puts "100 Audit logs have been created"