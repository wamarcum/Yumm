require 'spec_helper'

feature "Deleting Categories" do
  let!(:manager) { FactoryGirl.create(:manager) }
  let!(:category) { FactoryGirl.create(:category)}
  before do
    sign_in_as!(manager)
    visit '/'
    click_link 'Manager Panel'
    click_link 'Items'
  end

  scenario "Deleting a Category" do
    click_link "Delete #{category.name.capitalize.pluralize}"
    expect(page).to have_content("Category has been deleted.")
  end

end
