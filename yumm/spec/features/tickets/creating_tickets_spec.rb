require 'spec_helper'

feature 'Creating Tickets' do
  let!(:employee) { FactoryGirl.create(:employee) }
  let!(:table) { FactoryGirl.create(:table) }
  before do
    sign_in_as!(employee)
    click_link table.number
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

