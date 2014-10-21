require 'spec_helper'

feature 'Signing up' do
  scenario 'Successful sign up' do
    visit '/'
    click_link 'Sign up'
    fill_in "Name", with: "Roger"
    fill_in "Pin", with: "22"
    click_button "Sign up"
    expect(page).to have_content("You have signed up successfully.")
  end
end

