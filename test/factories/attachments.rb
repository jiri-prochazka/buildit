FactoryGirl.define do
	factory :attachment_one, class: Attachment do
	  name "Invoice"
	  association :job, factory: :job_one, strategy: :build
	  created_at "2015-02-17 17:31:09"
	  updated_at "2015-02-17 17:31:09"
	  file_file_name "file.pdf"
	  file_content_type "application/pdf"
	  file_file_size 11719
	  file_updated_at "2015-02-17 17:31:08"
	end
end