class Job < ActiveRecord::Base
  belongs_to :project
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, :reject_if => :all_blank, :allow_destroy => true

  validates :name, presence: true

  def completed?
  	self.progress == 100
  end
end
