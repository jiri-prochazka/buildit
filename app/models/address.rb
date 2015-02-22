class Address

  	include Mongoid::Document
	include Mongoid::Timestamps

	field :street, type: String
	field :city, type: String
	field :zip, type: Integer
	field :country, type: String

  belongs_to :user

  validates :city, :zip, :country, presence: true
end
