require 'spec_helper'

feature "Creating Categories" do
  let!(:manager) { FactoryGirl.create(:manager) }
  before do
    sign_in_as!(manager)
    visit '/'
    click_link 'Manager Panel'
    click_link 'Items'
  end

  scenario "Adding a Category" do
    click_link "Add Category"
    fill_in "Name", with: "Dessert"
    click_button "Add Category"
    expect(page).to have_content("Category has been created.")
  end

end

