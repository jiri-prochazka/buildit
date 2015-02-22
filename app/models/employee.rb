class Employee < User

	field :employed_since, type: DateTime
	field :admin, type: Boolean, default: false
	field :position, type: String
	
	has_many :projects
	has_many :attachments

	after_create :set_as_employee

	private

	def set_as_employee
	    self.update_attribute(:_type, "Employee")
    	self.update_attribute(:role, "manager")
	end
end
