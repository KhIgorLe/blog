require 'rails_helper'

feature 'any user can view category', %q{
  In order to see category from a posts
  As an any user
  I'd like to be able to view category
} do

  given(:category) { create(:category) }

  scenario 'Any users can view question' do
    visit category_path(category)

    expect(page).to have_content category.name
    expect(page).to have_content category.description
  end
end
