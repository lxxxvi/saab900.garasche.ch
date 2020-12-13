require 'test_helper'

class Admin::UploadFormTest < ActionDispatch::IntegrationTest
  test 'publish an upload' do
    upload_file(fixture_file_upload('image.png'))
    upload = Upload.last

    form = Admin::UploadForm.new(upload, publish: '1')
    assert form.valid?

    assert_difference -> { Upload.published.count }, 1 do
      assert form.save
    end
  end

  test 'validate pdf' do
    upload_file(fixture_file_upload('pdf.pdf'))
    upload = Upload.last

    form = Admin::UploadForm.new(upload)
    assert_not form.valid?

    assert_includes form.errors.to_a, 'Beschreibung darf nicht leer sein'

    form = Admin::UploadForm.new(upload, title: 'Title')
    assert form.save
  end
end
