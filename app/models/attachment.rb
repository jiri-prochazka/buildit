class Attachment < ActiveRecord::Base
  belongs_to :job
  has_attached_file :file

  validates_attachment :file, :presence => true,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png",'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/pdf',"application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"] },
  :size => { :in => 0..10.megabytes }

  def label
  	name + " (" + file_file_name + ")"
  end
end
