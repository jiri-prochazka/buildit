class Employee < User
	has_many :projects
	has_many :attachments

	before_create :set_as_employee

	private

	  def set_as_employee
	  	self.type = "Employee"
	    self.role = "manager"
	  end
end
