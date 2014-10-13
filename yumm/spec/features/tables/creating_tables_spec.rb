require 'spec_helper'

feature 'Creating Tables' do
  before :each do
    visit '/'

    click_link 'New Table'
  end
  scenario 'can create a table' do
    fill_in 'Number', with: '0'
    fill_in 'Guests', with: '9'
    click_button 'Create Table'
    expect(page).to have_content('Table has been seated!')

    table = Table.where(number: '0').first
    expect(page.current_url).to eql(table_url(table))
  end

  scenario 'can not create a table without a number' do
    click_button 'Create Table'

    expect(page).to have_content("Table has not been seated.")
    expect(page).to have_content("Number can't be blank")
  end
end

