class Project
	include Mongoid::Document
	include Mongoid::Timestamps

	field :name, type: String
	field :estimated_finish, type: DateTime
	field :completed_at, type: DateTime
	field :archived, type: Boolean, default: false

	has_many :jobs, dependent: :destroy
	has_many :requirements, dependent: :destroy
	belongs_to :concept
	belongs_to :employee
	belongs_to :customer

	validates :name, presence: true
	validate :check_concept_for_project, on: :create
	before_create :set_customer, if: Proc.new { |project| project.customer.nil? }

	after_save :set_completed_at, if: Proc.new { |project| project.completed_at.nil? }

	accepts_nested_attributes_for :jobs, :reject_if => :all_blank, :allow_destroy => true

	def estimated_price
		self.jobs.sum(:estimated_price)
	end

	def estimated_time
		self.jobs.sum(:estimated_time)
	end

	def progress
		self.jobs.avg(:progress).to_i
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
		if self.completed? and self.jobs.size > 0
			self.completed_at = DateTime.now
			self.save
		end
	end

	def set_customer
		self.customer = self.concept.user if self.concept.user.is_a?(Customer)
	end
end
