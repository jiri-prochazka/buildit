class Concept < ActiveRecord::Base
	has_one :project
	belongs_to :user

	
	def has_project?
		!self.project.nil?		
	end	
end
