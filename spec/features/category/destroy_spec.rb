require 'rails_helper'

feature 'Any user can delete category', %q{
  In order to delete category from posts
  I'd like to be able to delete category
} do

  given!(:categories) { create_list(:category, 3) }

  scenario 'Question author can delete question' do
    category = categories[1]
    visit categories_path

    within "#category_#{category.id}" do
      click_on 'Delete'
    end

    expect(page).to have_content 'Category successfully deleted.'
    expect(page).to_not have_content category.name
  end

end
