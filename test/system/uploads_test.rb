require "application_system_test_case"

class UploadsTest < ApplicationSystemTestCase
  test 'visitor uploads an image' do
    visit root_path
    click_on 'Bild hochladen'
    attach_file 'Bild auswählen', Rails.root.join('test/fixtures/files/image.png')
    click_on 'Hochladen'
    assert_selector '.flash-notice', text: 'Vielen Dank. Dein Bild wurde hochgeladen, wir geben es in kürze frei.'
  end
end
