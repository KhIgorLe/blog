require 'rails_helper'

feature 'any user can view list of all categories', %q{
  In order to get list of categories from a posts
  As an any user
  I'd like to be able to view list of all categories
} do

  given!(:categories) { create_list(:category, 3) }

  scenario 'Any users can view list of all categories' do
    visit categories_path

    categories.each { |category| expect(page).to have_content category.name }
  end
end
