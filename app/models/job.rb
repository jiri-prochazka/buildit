class Job < ActiveRecord::Base
  belongs_to :project
  has_many :attachments
  accepts_nested_attributes_for :attachments, :reject_if => :all_blank, :allow_destroy => true

  def completed?
  	self.progress == 100
  end
end
