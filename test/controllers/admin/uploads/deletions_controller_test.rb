require 'test_helper'

class Admin::Uploads::DeletionsControllerTest < ActionDispatch::IntegrationTest
  test 'post create' do
    sign_in_admin

    assert_difference -> { Upload.count }, -1 do
      post admin_upload_deletion_path(uploads(:image))
    end

    follow_redirect!
    assert_response :success
    assert_equal 'Beitrag gelöscht', flash[:success]
  end
end
