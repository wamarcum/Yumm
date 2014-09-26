require 'spec_helper'

feature 'Creating Tables' do
  scenario 'can create a table' do
    visit '/'

    click_link 'New Table'
    fill_in 'Number', with: "0"
    fill_in 'Guests', with: "9"
    click_button 'Create Table'

    expect(page).to have_content('Table has been seated!')

    table = Table.where(number: "0").first
    expect(page.current_url).to eql(table_url(table))
  end
end
