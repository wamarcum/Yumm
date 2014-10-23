module AuthHelpers
  def sign_in(employee)
    session[:employee_id] = employee.id
  end
end

Rspec.configure do |c|
  c.include AuthHelpers, type: :controller
end

