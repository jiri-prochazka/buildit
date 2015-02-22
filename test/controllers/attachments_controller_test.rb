require 'test_helper'

class AttachmentsControllerTest < ActionController::TestCase
  setup do
    delete_factories
    @attachment = create(:attachment_one)
    @user = create(:employee1)
    sign_in @user
  end

  test "should destroy attachment" do
    assert_difference('Attachment.count', -1) do
      delete :destroy, id: @attachment, remote: true, format: :js
    end
  end
end
