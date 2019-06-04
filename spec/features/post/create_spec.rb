require 'rails_helper'

feature 'Any user can create posts for category', %q{
  In order to create an post
  As any user
  I'd like to be able to create the post for category
} do

  given(:category) { create(:category) }

  describe 'Any user' do
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

    context 'with attach file', js: true do
      scenario 'can created post' do
        fill_in 'Name', with: 'Test name.'
        fill_in 'Content', with: 'Test content'

        attach_file 'File', "#{Rails.root}/spec/fixtures/category.jpeg"

        click_on 'Add post'

        within '.posts' do
          expect(page).to have_css("img[src*='category.jpeg']")
        end
      end

      scenario 'not create post' do
        fill_in 'Name', with: 'Test name.'
        fill_in 'Content', with: 'Test content'

        attach_file 'File', "#{Rails.root}/spec/fixtures/image.jpg"

        click_on 'Add post'

        within '.post_errors' do
          expect(page).to have_content 'File must be less than 2 MB'
        end

        within '.posts' do
          expect(page).to_not have_css("img[src*='image.jpg']")
        end
      end
    end
  end
end
