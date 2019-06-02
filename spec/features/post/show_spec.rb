require 'rails_helper'

feature 'any user can view post', %q{
  In order to see post
  As an any user
  I'd like to be able to view post
} do

  given(:post) { create(:post) }

  scenario 'Any users can view post' do
    visit post_path(post)

    expect(page).to have_content post.name
    expect(page).to have_content post.content
  end
end
