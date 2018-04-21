require 'rails_helper'

feature 'navigation' do
	background do
		@admin_user = FactoryGirl.create(:admin_user)
		login_as(@admin_user, :scope => :user)
	end

	feature 'edit' do
		background do
			@post  = FactoryGirl.create(:post)
			visit edit_post_path(@post)
		end

		scenario 'has a status that can be edited on the form by an admin' do
			choose 'post_status_approved'
			click_on 'Save'

			expect(@post.reload.status).to eq('approved')
		end

		scenario 'can not be edited by a nonadmin user' do
			logout(:user)
			user = FactoryGirl.create(:user)
			login_as(user, :scope => :user)

			visit edit_post_path(@post)

			expect(page).to_not have_content('Approved')
		end
	end


end