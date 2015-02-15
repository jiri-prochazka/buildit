class Project < ActiveRecord::Base
	has_many :jobs, dependent: :destroy
	has_many :requirements
	belongs_to :concept
	belongs_to :employee
	belongs_to :customer

	validates :name, presence: true
	validate :check_concept_for_project, on: :create
	before_create :set_customer, if: Proc.new { |project| project.customer_id.nil? }

	after_save :set_completed_at, if: Proc.new { |project| project.completed_at.nil? }

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
		self.jobs.map(&:completed?).all?
	end

	private

	def check_concept_for_project
		if Project.where(concept_id: concept.id).size == 1 
	      errors.add(:concept_id, "already has a project.")
	    end
	end

	def set_completed_at
		if self.completed?
			self.completed_at = DateTime.now
			self.save
		end
	end

	def set_customer
		self.customer = self.concept.user
	end
end
