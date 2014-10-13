require 'spec_helper'

feature 'Creating Tickets' do
  before do
    FactoryGirl.create(:table, number: "9")
    visit '/'
    click_link '9'
    click_link 'New Ticket'
  end
  
  scenario "Creating a Ticket" do
    fill_in "Title", with: "First Ticket"
    click_button "Create Ticket"
    expect(page).to have_content("Ticket has been created.")
  end

  scenario "Creating a Ticket without attributes fails" do
    click_button "Create Ticket"
    expect(page).to have_content("Ticket has not been created.")
    expect(page).to have_content("Title can't be blank")
  end
  
end

