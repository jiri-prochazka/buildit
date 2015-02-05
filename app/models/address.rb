class Address < ActiveRecord::Base
  belongs_to :user

  validates :city, :zip, :country, presence: true
end
