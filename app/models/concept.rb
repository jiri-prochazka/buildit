class Concept < ActiveRecord::Base
	has_one :project
	belongs_to :user
end
