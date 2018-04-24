FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
  	first_name "Jon"
  	last_name 'Snow'
  	email { generate :email }
  	password 'hogehoge'
  	password_confirmation 'hogehoge'
  end

  factory :admin_user, class: "AdminUser" do
  	first_name "Admin"
  	last_name 'User'
    email { generate :email }
  	password 'hogehoge'
  	password_confirmation 'hogehoge'  	
  end

  factory :non_authorized_user, class: "User" do
    first_name "Noe"
    last_name 'Authorized'
    email { generate :email }
    password 'hogehoge'
    password_confirmation 'hogehoge'    
  end
end