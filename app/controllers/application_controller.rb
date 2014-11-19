class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  private

  def require_signin!
    if current_employee.nil?
      flash[:error] = "You need to sign in before continuing."
      redirect_to signin_url
    end
  end
  helper_method :require_signin!

  def current_employee
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Invalid session ID."
  end
  helper_method :current_employee

  def authorize_manager!
    require_signin!

    unless current_employee.manager?
      flash[:alert] = "You must be a manager to do that."
      redirect_to root_path
    end
  end
end

