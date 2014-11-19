require 'spec_helper'

feature "Sigining In" do
  scenario "as a Manager" do
    manager = FactoryGirl.create(:employee, manager: true)
    visit '/'
    click_link 'Sign in'
    fill_in 'Pin', with: manager.pin
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_link("Manager Panel")
  end
end

