require 'rails_helper'

feature 'navigate' do
  feature 'homepage' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end
end