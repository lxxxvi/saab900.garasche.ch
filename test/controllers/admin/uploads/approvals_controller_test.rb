require 'test_helper'

class Admin::Uploads::ApprovalsControllerTest < ActionDispatch::IntegrationTest
  test 'post create' do
    file = fixture_file_upload('files/image.png')
    post uploads_path, params: { upload: { file: file } }

    sign_in_admin

    last_upload = Upload.last

    assert_difference -> { Upload.approved.count }, 1 do
      post admin_upload_approval_path(last_upload)
    end

    follow_redirect!
    assert_response :success
    assert_equal 'Eintrag wurde akzeptiert', flash[:success]
  end
end
