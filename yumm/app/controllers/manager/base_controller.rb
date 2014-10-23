class Manager::BaseController < ApplicationController
  before_action :authorize_manager!

  def index
  end
end

