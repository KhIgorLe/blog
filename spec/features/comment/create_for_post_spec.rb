require 'rails_helper'

feature 'User can create comments for category', %q{
  In order to create comments to category
  I'd like to be able to set comments for category
} do

  given(:post) { create(:post) }

  describe 'Any user' do
    background do
      visit post_path(post)
    end

    scenario 'give comment for category', js: true do
      within '.post' do
        click_on 'Add comment'
        fill_in 'Comment body', with: 'it comment'
        click_on 'Save comment'

        expect(page).to_not have_selector "#Add-Post-Comment-#{post.id}"
      end

      within '.post-comments' do
        expect(page).to have_content 'it comment'
      end
    end

    scenario 'give comment with error', js: true do
      within '.post' do
        click_on 'Add comment'
        click_on 'Save comment'
      end

      within '.comment_errors' do
        expect(page).to have_content "Body can't be blank"
      end
    end
  end
end
