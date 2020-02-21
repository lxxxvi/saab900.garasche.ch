require 'application_system_test_case'

class UploadsTest < ApplicationSystemTestCase
  test 'visitor uploads an image' do
    upload_file('test/fixtures/files/image.png')
    assert_selector '.flash-notice', text: 'Vielen Dank. Dein Beitrag wurde hochgeladen, wir geben es in kürze frei.'
  end
end
