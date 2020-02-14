require 'test_helper'

class UploadsControllerTest < ActionDispatch::IntegrationTest
  test 'uploads image' do
    upload_file(fixture_file_upload('files/image.png'))
    assert_success
  end

  test 'uploads pdf' do
    upload_file(fixture_file_upload('files/pdf.pdf'))
    assert_success
  end

  test 'uploads nothing' do
    upload_file(nil, 0)
    assert_alert
  end

  test 'uploads unsupported file format' do
    upload_file(fixture_file_upload('files/docx.docx'), 0)
    assert_alert
  end

  private

  def assert_success
    follow_redirect!
    assert_response :success
    assert_equal 'Vielen Dank. Dein Bild wurde hochgeladen, wir geben es in kürze frei.', flash[:notice]
  end

  def assert_alert
    assert_response :success
    assert_equal 'Irgendwas hat nicht geklappt, versuchs nochmal ;-)', flash[:alert]
  end
end
