require 'spec_helper'

feature "Items" do
  let!(:manager) { FactoryGirl.create(:manager) }
  let!(:category) { FactoryGirl.create(:category) }
  before do
    sign_in_as!(manager)
    visit '/'
    click_link 'Manager Panel'
    click_link 'Items'
    expect(page).to have_content("Items")
  end

  it "displays each Category" do
    expect(page).to have_content("Beverages")
  end
end

