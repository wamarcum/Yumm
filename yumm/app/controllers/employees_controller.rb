class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = "You have signed up successfully."
      redirect_to tables_path
    else
      render :new
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :pin)
  end
end

