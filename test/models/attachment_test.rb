require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase

	setup do
		delete_factories
	end

	test "atachment label" do
	 	a = create(:attachment_one)
	  	assert_equal "Invoice (file.pdf)", a.label
	end
end
