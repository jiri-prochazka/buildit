class UsersController < ApplicationController
  def index
  	@customers = Customer.all
  	@employees = Employee.all
  	@users = User.all
  end

  def change_type
  	user = User.find(params[:id])
  	if user.class == Customer
  		user.type = "Employee"
  		user.save
  	elsif user.class == Employee
  		user.type = "Customer"
  		user.save
  	end
  	redirect_to :back
  end
end
