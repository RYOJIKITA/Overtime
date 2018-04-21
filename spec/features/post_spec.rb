require 'rails_helper'

feature 'navigate' do
  background do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  feature 'index' do
    background do
      visit posts_path
    end
  	scenario 'can be reached successfully' do
  		expect(page.status_code).to eq(200)
  	end
  	scenario 'has a title of Posts' do
  		expect(page).to have_content(/Posts/)
  	end
    scenario 'has a list of posts' do
      post1 = FactoryGirl.build_stubbed(:post)
      post2 = FactoryGirl.build_stubbed(:second_post)
      visit posts_path
      expect(page).to have_content(/Rationale|content/)
    end
  end

  feature 'new' do
    scenario 'has a link for homapage' do
      visit root_path

      click_link ("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  feature 'delete' do
    scenario 'can be deleted' do
      @post = FactoryGirl.create(:post)
      visit posts_path

      click_link ("delete_post_#{@post.id}_from_index")
      expect(page.status_code).to eq(200)      
    end
  end

  feature 'creation' do
  	background do
  		visit new_post_path
  	end
  	scenario 'has a new form that can be reached' do
  		expect(page.status_code).to eq(200)
  	end
  	scenario 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      click_on "Save"

      expect(page).to have_content("Some rationale")
  	end
    scenario 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end

  describe 'edit' do
    background do
      @post = FactoryGirl.create(:post)
    end
    scenario 'can be reached by clicking edit on index page' do
      visit posts_path
      click_link ("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
    end
    scenario 'can be edited' do
      visit edit_post_path(@post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited post"
      click_on "Save"

      expect(page).to have_content("Edited post")
    end
  end
end