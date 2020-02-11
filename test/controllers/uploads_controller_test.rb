require 'test_helper'

class UploadsControllerTest < ActionDispatch::IntegrationTest
  test 'uploads image' do
    image = fixture_file_upload('files/image.png')

    assert_difference -> { Upload.count }, 1 do
      post uploads_path, params: { upload: { file: image } }
    end

    follow_redirect!
    assert_response :success
    assert_equal 'Upload erfolgreich', flash[:success]
  end

  test 'uploads pdf' do
    image = fixture_file_upload('files/pdf.pdf')

    assert_difference -> { Upload.count }, 1 do
      post uploads_path, params: { upload: { file: image } }
    end

    follow_redirect!
    assert_response :success
    assert_equal 'Upload erfolgreich', flash[:success]
  end

  test 'uploads nothing' do
    assert_no_difference -> { Upload.count } do
      post uploads_path, params: { upload: { file: nil } }
    end

    follow_redirect!
    assert_response :success
    assert_equal 'Irgendwas hat nicht geklappt, versuchs nochmal ;-)', flash[:alert]
  end

  test 'uploads unsupported file format' do
    assert false
  end
end
