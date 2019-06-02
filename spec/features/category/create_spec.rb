require 'rails_helper'

feature 'User can create category', %q{
  In order to create category from a posts
  I'd like to be able to create category
} do

  describe 'Any user' do
    background do
      visit categories_path
      click_on 'Add category'
    end

    scenario 'create category' do
      fill_in 'Name', with: 'My name.'
      fill_in 'Description', with: 'text text text'
      click_on 'Save'

      expect(page).to have_content 'Category successfully created.'
      expect(page).to have_content 'My name.'
      expect(page).to have_content 'text text text'
    end

    scenario 'tries to create category with errors' do
      click_on 'Save'
      expect(page).to have_content "Name can't be blank"
    end
  end
end
