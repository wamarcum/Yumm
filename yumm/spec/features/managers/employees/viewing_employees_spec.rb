require 'spec_helper'

feature "Viewing Employees" do
  let(:manager) { FactoryGirl.create(:manager) }
  let(:employee) { FactoryGirl.create(:employee) }
  before do
    sign_in_as!(manager)
    visit '/'
    click_link 'Manager Panel'
    click_link "Employees"
  end
  scenario "viewing all Employees" do
    expect(page).to have_link(employee.name)
  end

end

