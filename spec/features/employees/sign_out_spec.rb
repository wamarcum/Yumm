require 'spec_helper'

feature "Signing Out" do
  let!(:employee) { FactoryGirl.create(:employee) }
  before do
    visit '/'
  end
  scenario "as an Employee" do
    sign_in_as!(employee)
    click_link 'Sign out'
    expect(page).to have_content('Signed out successfully.')
  end
end
