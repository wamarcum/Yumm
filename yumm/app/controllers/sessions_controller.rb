class SessionsController < ApplicationController

  def create
    session.clear
    employee = Employee.where(pin: params[:signin][:pin]).first
    if employee
      session[:employee_id] = employee.id
      flash[:notice] = "Signed in successfully."
      redirect_to root_url
    else
      flash[:error] = "Sorry."
      render :new
    end
  end

  def destroy
    session.delete(:employee_id)
    session.clear
    flash[:notice] = "Signed out successfully."
    redirect_to root_url
  end

end

