require 'spec_helper'

describe Manager::EmployeesController do
  let(:employee) { FactoryGirl.create(:employee) }

  context "standard Employees" do
    before { sign_in(employee) }

    it "cannot access the index action" do
      get :index
      expect(response).to redirect_to '/'
      expect(flash[:alert]).to eql("You must be a manager to do that.")
    end
  end

end

