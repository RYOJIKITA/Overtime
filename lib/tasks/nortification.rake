namespace :nortification do
  desc "Sends SMS nortification to employees asking them to log if they have overtime or not"
  task sms: :environment do
  	#1. Schedule to run at Sunday at 5PM
  	#2. Iterate over all employees
  	#3  Skip AdminUsers
  	#4  Send a messages that has instructions and a link to log time

  	#PhoneNumber should not have spaces and dashes
  	#PhoneNumber should be exactly 10 characters
  	#All characters should be number
  end

end