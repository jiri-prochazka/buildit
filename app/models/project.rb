class Project < ActiveRecord::Base
	has_many :jobs, dependent: :destroy
	has_many :requirements
	belongs_to :concept
	belongs_to :employee
	belongs_to :customer

	validates :name, presence: true
	validate :check_concept_for_project, on: :create

	before_save :set_completed_at, if: Proc.new { |project| project.completed? }

	accepts_nested_attributes_for :jobs, :reject_if => :all_blank, :allow_destroy => true

	def estimated_price
		self.jobs.sum(:estimated_price)
	end

	def estimated_time
		self.jobs.sum(:estimated_time)
	end

	def progress
		self.jobs.average(:progress).to_i
	end

	def completed?
		self.progress == 100
	end

	def self.users_projects(user)

		
	end

	private

	def check_concept_for_project
		if Project.where(concept_id: concept.id).size == 1 
	      errors.add(:concept_id, "already has a project.")
	    end
	end

	def set_completed_at
		self.completed_at = DateTime.now
	end
end
