require 'spec_helper'
feature Employee do
  context "Passwords" do
    scenario "saving a pin" do
      e = Employee.new(name: "bob")
      e.save
      expect(e).to_not be_valid

      e.pin = "12"
      e.save
      expect(e).to be_valid
    end
  end

  context "Authentication" do
    let!(:employee) { Employee.create(name: "bob",
                             pin: "12")}
    scenario "with a correct pin" do
      expect(employee.pin).to eql("12")
    end
  end

end

