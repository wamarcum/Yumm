require 'spec_helper'

feature "Inventory" do
  let!(:manager) { FactoryGirl.create(:manager) }
  before do
    sign_in_as!(manager)
    visit '/'
    click_link 'Manager Panel'
    click_link 'Inventory'
    expect(page).to have_content("Inventory")
  end
end

