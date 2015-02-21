class Requirement < ActiveRecord::Base
  belongs_to :project
  belongs_to :customer

  validates :content, presence: true
end
