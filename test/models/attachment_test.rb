require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase
  test "atachment label" do
  	a = attachments(:one)
  	assert_equal "Invoice (file.pdf)", a.label
  end
end
