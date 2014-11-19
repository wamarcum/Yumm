require 'spec_helper'

feature "Editing Employees" do
  let(:manager) { FactoryGirl.create(:manager) }
  let(:employee) { FactoryGirl.create(:employee) }
  before do
    sign_in_as!(manager)
    visit '/'
    click_link 'Manager Panel'
    click_link "Employees"
    click_link employee.name
    click_link "Edit Employee"
  end

  context "Updating an Employee" do
    scenario "With valid attributes" do
      fill_in "Pin", with: ((employee.pin.to_i)+1).to_s
      click_button "Submit"
      expect(page).to have_content "Employee has been updated."
    end

    scenario "With invalid attributes" do
      fill_in "Pin", with: ""
      click_button "Submit"
      expect(page).to have_content "Employee has not been updated."
    end
  end
end

