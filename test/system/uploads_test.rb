require 'application_system_test_case'

class UploadsTest < ApplicationSystemTestCase
  test 'visitor uploads an image' do
    visit root_path
    click_on 'Lade deinen Beitrag hoch'
    attach_file 'Bild auswählen', Rails.root.join('test/fixtures/files/image.png')
    click_on 'Hochladen'
    assert_selector '.flash-notice', text: 'Vielen Dank. Dein Beitrag wurde hochgeladen, wir geben es in kürze frei.'
  end
end
