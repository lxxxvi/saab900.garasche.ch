require 'test_helper'

class Admin::Upload::ApprovalFormTest < ActiveSupport::TestCase
  test 'approve an image' do
    upload = uploads(:image)
    form = Admin::Upload::ApprovalForm.new(upload)
    assert form.valid?
  end

  test 'approve a pdf' do
    upload = uploads(:pdf)
    form = Admin::Upload::ApprovalForm.new(upload)
    assert_not form.valid?

    assert_includes form.errors.to_a, 'Titel darf nicht leer sein'

    form = Admin::Upload::ApprovalForm.new(upload, title: 'Title')
    assert form.valid?
  end
end
