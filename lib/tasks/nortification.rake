namespace :nortification do
  desc "Sends SMS nortification to employees asking them to log if they have overtime or not"
  task sms: :environment do
    if Time.now.sunday?
      employees = Employee.all
      nortification_message = "Please log into the overtime management dashboard to request oveetime or confirm your hours for last week: https://rk-overtime.herokuapp.com"
      #4  Send a messages that has instructions and a link to log time
      employees.each do |employee|
        SmsTool.send_sms(number: employee.phone, message: nortification_message)
      end
    end
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