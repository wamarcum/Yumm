require 'spec_helper'
feature Employee do
  context "Passwords" do
    scenario "saving a password" do
      e = Employee.new(name: "bob")
      e.save
      expect(e).to_not be_valid

      e.password = "1234"
      e.password_confirmation = ""
      e.save
      expect(e).to_not be_valid

      e.password = "1234"
      e.password_confirmation = "1234"
      e.save
      expect(e).to be_valid
    end

    scenario "needs matching confirmation to be valid" do
      u = Employee.create(
        name: "bob",
        password: "1234",
        password_confirmation: "4321")
      expect(u).to_not be_valid
    end
  end

  context "Authentication" do
    let!(:user) { Employee.create(name: "bob",
                             password: "1234",
                             password_confirmation: "1234")}

    scenario "with a correct password" do
      expect(user.authenticate("1234")).to be
    end

    scenario "with an invalid password" do
      expect(user.authenticate("4321")).to_not be
    end
  end

end

