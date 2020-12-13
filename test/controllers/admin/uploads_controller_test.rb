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

  test 'publish upload' do
    file = fixture_file_upload('image.png')
    post uploads_path, params: { upload: { file: file } }

    sign_in_admin

    last_upload = Upload.last

    assert_difference -> { Upload.published.count }, 1 do
      patch admin_upload_path(last_upload),
            params: {
              admin_upload: {
                publish: '1'
              }
            }
    end

    follow_redirect!
    assert_response :success
    assert_equal 'Beitrag editiert', flash[:success]
  end

  test 'unpublish upload' do
    file = fixture_file_upload('image.png')
    post uploads_path, params: { upload: { file: file } }

    sign_in_admin

    last_upload = Upload.last
    last_upload.update(published_at: Time.zone.now)

    assert_difference -> { Upload.published.count }, -1 do
      patch admin_upload_path(last_upload),
            params: {
              admin_upload: {
                publish: '0'
              }
            }
    end

    follow_redirect!
    assert_response :success
    assert_equal 'Beitrag editiert', flash[:success]
  end

  test 'destroy' do
    sign_in_admin

    assert_difference -> { Upload.count }, -1 do
      delete admin_upload_path(uploads(:image))
    end

    follow_redirect!
    assert_response :success
    assert_equal 'Beitrag gelöscht', flash[:success]
  end
end
