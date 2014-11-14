require 'spec_helper'

feature "Viewing Ticket Items" do
  let!(:employee) { FactoryGirl.create(:employee) }
  let!(:table) { FactoryGirl.create(:table) }
  let!(:ticket) { FactoryGirl.create(:ticket, table: table) }
  let!(:item) { FactoryGirl.create(:item, ticket: ticket) }

  before do
    sign_in_as!(employee)
    visit '/'
    click_link table.number
    click_link ticket.title
  end
  
  scenario "Viewing Ticket Items" do
    expect(page).to have_content("Items")
    expect(page).to have_content(item.name)
  end

end

