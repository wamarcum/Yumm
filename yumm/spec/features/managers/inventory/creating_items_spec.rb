require 'spec_helper'

feature "Items" do
  let!(:manager) { FactoryGirl.create(:manager) }
  before do
    sign_in_as!(manager)
    visit '/'
    click_link 'Manager Panel'
    click_link 'Inventory'
  end

  scenario "adding an Item to inventory" do
    click_link "Add Item"
    fill_in "Name", with: "Pepsi"
    select "5", from: "Quantity"
    select "Beverage", from: "Category"
    click_button "Add Item"
    expect(page).to have_content("Item has been added.")
  end
end

