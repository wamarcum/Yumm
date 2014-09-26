require 'spec_helper'

feature 'Creating Tables' do
  scenario 'can create a table' do
    visit '/'

    click_link 'New Table'
    fill_in 'Number', with: 9
    fill_in 'Guests', with: 2
    click_button 'Create Table'

    expect(page).to have_content('Table has been seated!')
  end
end
