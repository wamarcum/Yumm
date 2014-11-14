class Manager::EmployeesController < Manager::BaseController
  def index
    @employees = Employee.order(:name)
  end

  def new
    @employee = Employee.new
  end

  def create
    params = employee_params.dup
    @employee = Employee.new(params)
    if @employee.save
      flash[:notice] = "Employee has been created."
      redirect_to manager_employees_path
    else
      flash[:alert] = "Employee has not been created."
      render :new
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id]) 
    if @employee.update(employee_params)
      flash[:notice] = "Employee has been updated."
      redirect_to [:manager, @employee]
    else
      flash[:alert] = "Employee has not been updated."
      render "edit"
    end

  end

  private
  def employee_params
    params.require(:employee).permit(:name, :pin)
  end

end

