require 'rails_helper'

feature 'Any user can create posts for category', %q{
  In order to create an post
  As any user
  I'd like to be able to create the post for category
} do

  given(:category) { create(:category) }

  describe 'Authenticated user' do
    background do
      visit category_path(category)
    end

    scenario 'create post', js: true do
      fill_in 'Name', with: 'Test name.'
      fill_in 'Content', with: 'Test content'
      click_on 'Add post'

      within '.posts' do
        expect(page).to have_content 'Test name.'
      end
    end

    scenario 'create post with errors', js: true do
      click_on 'Add post'
      expect(page).to have_content "Name can't be blank"
    end
  end
end
