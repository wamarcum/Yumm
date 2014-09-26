require 'spec_helper'

feature "Viewing Tables" do
  let!(:table) { FactoryGirl.create(:table) }
  scenario "shows the Table title" do
    visit table_url(table)

    expect(page.current_url).to eql(table_url(table))
    expect(page).to have_title(title)
  end
end

