require 'rails_helper'

feature 'admin dashboard' do
  scenario 'does not allow users access to without being signed in' do
  	visit admin_root_path
  	expect(current_path).to eq(new_user_session_path)
  end

  scenario 'cannot be reached by a non admin users' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit admin_root_path

    expect(current_path).to eq(root_path)
  end

  scenario 'can be reached by an admin users' do
    admin_user = FactoryGirl.create(:admin_user)
    login_as(admin_user, :scope => :user)

    visit admin_root_path

    expect(current_path).to eq(admin_root_path)
  end
end