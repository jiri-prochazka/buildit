class Project < ActiveRecord::Base
	has_many :jobs, :requirements
	belongs_to :concept
end
