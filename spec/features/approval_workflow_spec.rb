require 'rails_helper'

feature 'navigation' do
	background do
		@admin_user = FactoryGirl.create(:admin_user)
		login_as(@admin_user, :scope => :user)
	end

	feature 'edit' do
		background do
			@post  = FactoryGirl.create(:post)
		end

		scenario 'has a status that can be edited on the form' do
			visit edit_post_path(@post)

			choose 'post_status_approved'
			click_on 'Save'

			expect(@post.reload.status).to eq('approved')
		end
	end


end