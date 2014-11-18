require 'spec_helper'

feature "Items" do
  let!(:manager) { FactoryGirl.create(:manager) }
  let!(:category) { FactoryGirl.create(:category) }
  before do
    sign_in_as!(manager)
    visit '/'
    click_link 'Manager Panel'
    click_link 'Items'
  end

  scenario "adding an Item" do
    click_link "Add Item"
    select "Beverage", from: "Category"
    fill_in "Name", with: "Pepsi"
    fill_in "Cost", with: "1.00"
    select "5", from: "Quantity"
    click_button "Add Item"
    expect(page).to have_content("Item has been created.")
  end
end

