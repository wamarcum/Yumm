require 'spec_helper'

feature 'Editing Tables' do
  before do
    FactoryGirl.create(:table, number: '4', guests: '5')
    visit '/'
    click_link '4'
    click_link 'Edit Table'
  end

  scenario 'Updating a Table' do
    fill_in 'Guests', with: '6'
    click_button 'Update Table'
    expect(page).to have_content('Table has been updated.')
  end

  scenario "Updating a Table with invalid attributes fails" do
    fill_in "Guests", with: ""
    click_button "Update Table"
    expect(page).to have_content("Table has not been updated.")
  end

end

