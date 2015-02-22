class Job
	include Mongoid::Document
	include Mongoid::Timestamps

	field :name, type: String
	field :description, type: String
	field :confirmed_at, type: DateTime
	field :progress, type: Integer
	field :estimated_time, type: Integer
	field :estimated_price, type: Float
	field :real_price, type: Float
	field :completed_at, type: DateTime

	
  belongs_to :project
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, :reject_if => :all_blank, :allow_destroy => true

  validates :name, presence: true

  def completed?
  	self.progress == 100
  end
end
