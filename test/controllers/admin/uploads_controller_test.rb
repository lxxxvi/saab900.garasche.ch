require 'test_helper'

class Admin::UploadsControllerTest < ActionDispatch::IntegrationTest
  test 'get index' do
    sign_in_admin

    get admin_uploads_path
    assert_response :success
  end

  test 'cannot get index without login' do
    get admin_uploads_path
    follow_redirect!
    assert_response :success

    assert_equal 'Bitte zuerst einloggen', flash[:notice]
  end
end
