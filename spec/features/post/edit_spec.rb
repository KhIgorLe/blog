require 'rails_helper'

feature 'any user can edit post', %q{
  In order to edit mistakes
  I'd like to be able to edit post
} do
  given(:category) { create(:category) }
  given!(:post) { create(:post, category: category) }

  describe 'post owner' do
    background do
      visit category_path(category)
      click_on 'Edit'
    end

    scenario 'tries edit post', js: true do
      within '.posts' do
        fill_in 'Name', with: 'New name.'
        fill_in 'Content', with: 'New content'
        click_on 'Save post'

        expect(page).to_not have_content post.name
        expect(page).to have_content 'New name.'
        expect(page).to_not have_selector 'textarea'
      end
    end

    scenario 'tries edit post with errors', js: true do
      within '.posts' do
        fill_in 'Name', with: ''
        click_on 'Save post'
      end

      within '.post_errors' do
        expect(page).to have_content "Name can't be blank"
        expect(page).to have_content 'name must be at least two words with two letters in each word, ' \
                       'the first word with a capital letter, the rest with a small one. ' \
                       'Dot at the end.'
      end
    end
  end
end
