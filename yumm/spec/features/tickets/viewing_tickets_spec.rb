require 'spec_helper'

feature 'Viewing Tickets' do
  let!(:table) { FactoryGirl.create(:table) }
  let!(:ticket) { FactoryGirl.create(:ticket, table: table) }
  before do
    visit '/'
  end

  scenario "Viewing Tickets for a given Table" do
    click_link table.number
    expect(page).to have_content("Tickets")
    expect(page).to have_content ticket.title
  end
end

