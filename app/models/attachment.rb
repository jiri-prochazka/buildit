class Attachment 

	include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::Paperclip

	field :name, type: String

  belongs_to :job
  belongs_to :employee
  
  has_mongoid_attached_file :file

  validates_attachment :file, :presence => true,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png",'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/pdf',"application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"] },
  :size => { :in => 0..10.megabytes }

  def label
  	name + " (" + file_file_name + ")"
  end
end
