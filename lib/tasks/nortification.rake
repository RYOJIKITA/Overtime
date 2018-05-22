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

  desc "Sends Email nortification to managers (admin users) each day to inform pending overtime requests"
  task manager_email: :environment do
    #1 Iterate over the list of pending overtime request (status: submitted not approved or rejected)
    #2 Check to see if there are any requests 
    #3 Iterate ovner the list of admin user/manager
    #4 Send the email to each admin user/manager
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end

end