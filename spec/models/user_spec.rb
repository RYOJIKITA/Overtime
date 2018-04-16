require 'rails_helper'

RSpec.describe User, type: :model do
	describe "creation" do
		before do
			@user = User.create(email: "test@gmail.com", password: "hogehoge", password_confirmation: "hogehoge", first_name: "jon", last_name: "dan")
		end

		it "can be created" do
			expect(@user).to be_valid
		end

		it "can not be created without first_name and last_name" do
			@user.first_name = nil
			@user.last_name = nil
			expect(@user).to_not be_valid
		end
	end
end
