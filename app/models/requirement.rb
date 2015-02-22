class Requirement
	include Mongoid::Document
	include Mongoid::Timestamps

	field :content, type: String

  belongs_to :project
  belongs_to :customer

  validates :content, presence: true
end
