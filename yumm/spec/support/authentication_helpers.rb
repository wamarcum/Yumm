module AuthenticationHelpers
  def sign_in_as!(employee)
    visit '/signin'
    fill_in "Pin", with: employee.pin
    click_button "Sign in"
    expect(page).to have_content("Signed in successfully.")
  end

  def sign_out
    session.delete(:employee_id)
  end
end

RSpec.configure do |c|
  c.include AuthenticationHelpers, type: :feature
end

