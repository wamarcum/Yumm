require 'spec_helper'

feature "Creating Items" do
  let!(:employee) { FactoryGirl.create(:employee) }
  let!(:table) { FactoryGirl.create(:table) }
  let!(:ticket) { FactoryGirl.create(:ticket, table: table) }

  before do
    sign_in_as!(employee)
    visit '/'
    click_link table.number
    click_link ticket.title
  end

  scenario "Adding a Item to a Ticket" do
    fill_in "Name", with: "Somethingpizza"
    select "5", from: "Quantity"
    fill_in "Comment", with: "Burn it"
    click_button "Add Item"
    expect(page).to have_content("Item has been added.")
  end

  scenario "Adding an Item with invalid attributes" do
    click_button "Add Item" 
    expect(page).to have_content("Item has not been added.")
  end
end


