require 'spec_helper'

feature "Manager Panel" do
  let!(:manager) { FactoryGirl.create(:manager) }
  before do
    sign_in_as!(manager)
    visit '/'
    click_link 'Manager Panel'
    expect(page).to have_content("Manager Panel")
  end

  it "displays action items" do
    expect(page).to have_link("Tables")
    expect(page).to have_link("Employees")
    expect(page).to have_link("Items")
  end

end

