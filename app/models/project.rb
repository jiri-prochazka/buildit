class Project < ActiveRecord::Base
	has_many :jobs 
	has_many :requirements
	belongs_to :concept
	belongs_to :employee
	belongs_to :customer
end
