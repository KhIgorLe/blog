require 'rails_helper'

feature 'Any user can edit category', %q{
  In order to edit mistakes
  As an any user
  I'd like to be able to edit category
} do

  given(:categories) { create_list(:category, 3) }

  describe 'Any use'  do
    given!(:category) { categories[1] }

    background do
      visit categories_path

      within "#category_#{category.id}" do
        click_on 'Edit'
      end
    end

    scenario 'can change category attributes' do
      fill_in 'Name', with: 'My name.'
      fill_in 'Description', with: 'New description'
      click_on 'Save'

      within "#category_#{category.id}" do
        expect(page).to_not have_content category.name
        expect(page).to have_content 'My name.'
      end
    end

    scenario 'tries to change category with errors' do
      fill_in 'Name', with: ''
      click_on 'Save'

      expect(page).to have_content "Name can't be blank"
    end
  end
end
