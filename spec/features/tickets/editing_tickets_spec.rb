require 'spec_helper'

feature "Editing Tickets" do
  let!(:table) { FactoryGirl.create(:table) }
  let!(:ticket) { FactoryGirl.create(:ticket, table: table) }

  before do
    visit '/'
    click_link table.number
    click_link ticket.title
    click_link 'Edit Ticket'
  end

  scenario "Updating a Ticket" do
    fill_in "Title", with: "Modified Pizza"
    click_button "Update Ticket"
    expect(page).to have_content("Ticket has been updated.")

    expect(page).to have_content("Modified Pizza")
    expect(page).to_not have_content ticket.title
  end

  scenario "Updating a Ticket with invalid attributes" do
    fill_in "Title", with: ""
    click_button "Update Ticket"
    expect(page).to have_content("Ticket has not been updated.")
  end

end

