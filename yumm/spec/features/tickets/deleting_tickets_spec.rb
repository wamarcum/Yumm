require 'spec_helper'

feature 'Deleting tickets' do
  let!(:table) { FactoryGirl.create(:table) }
  let!(:ticket) { FactoryGirl.create(:ticket, table: table) }

  before do
    visit '/'
    click_link table.number
    click_link ticket.title
  end

  scenario "Deleting a ticket" do
    click_link "Delete Ticket"
    expect(page).to have_content("Ticket has been destroyed.")
  end
end

