class Concept
	
	include Mongoid::Document
	include Mongoid::Timestamps

	field :name, type: String
	field :price, type: Float
	field :start_at, type: DateTime
	field :end_at, type: DateTime
	field :description, type: String
	field :archived, type: Boolean, default: false

	has_one :project
	belongs_to :user

	validates :name, :description, presence: true
	
	def has_project?
		!self.project.nil?		
	end	
end
