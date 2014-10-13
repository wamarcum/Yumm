require 'spec_helper'

feature "Deleting Tables" do
  scenario "Deleting a Table" do
    FactoryGirl.create(:table, number: "9")

    visit "/"
    click_link "9"
    click_link "Delete Table"
    expect(page).to have_content("Table has been destroyed.")

    visit "/"
    expect(page).to have_no_content("9")
  end
end

