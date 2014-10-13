require 'spec_helper'

describe TablesController do
  it "displays an error for a missing table" do
    get :show, id: "not-here"

    expect(response).to redirect_to(tables_path)
    message = "The Table you were looking for could not be found."

    expect(flash[:alert]).to eql(message)
  end
end

