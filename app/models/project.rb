class Project < ActiveRecord::Base
	has_many :jobs, dependent: :destroy
	has_many :requirements
	belongs_to :concept
	belongs_to :employee
	belongs_to :customer

	validates :name, presence: true
	validate :check_concept_for_project, on: :create

	accepts_nested_attributes_for :jobs, :reject_if => :all_blank, :allow_destroy => true

	private

	def check_concept_for_project
		if Project.where(concept_id: concept.id).size == 1 
	      errors.add(:concept_id, "already has a project.")
	    end
	end
end
