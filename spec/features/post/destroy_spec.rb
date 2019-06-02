require 'rails_helper'

feature 'any user can delete post', %q{
  In order to delete post
  I'd like to be able to delete post
} do

  given(:category) { create(:category) }
  given!(:post) { create(:post, category: category) }

  scenario 'any use can delete post', js: true do
    visit category_path(category)

    within '.posts' do
      page.accept_confirm { click_on 'Delete post' }
    end

    expect(page).to_not have_content post.name
  end
end
