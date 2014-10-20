require 'spec_helper'

feature "Signing In" do
  scenario "as an Employee" do
    employee = FactoryGirl.create(:employee)

    visit '/'
    click_link 'Sign in'
    fill_in 'Pin', with: employee.pin
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully.')
  end

end

