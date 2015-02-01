class Job < ActiveRecord::Base
  belongs_to :project
  has_many :attachments
end
