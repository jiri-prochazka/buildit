class Customer < User

	field :salutation, type: String
	field :nationality, type: String
	field :newsletter, type: Boolean, default: false

	has_many :projects
end
