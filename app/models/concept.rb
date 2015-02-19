class Concept < ActiveRecord::Base
	has_one :project
	belongs_to :user

	validates :name, :description, presence: true
	
	def has_project?
		!self.project.nil?		
	end	
end
