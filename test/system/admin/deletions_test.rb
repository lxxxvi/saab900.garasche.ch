require 'application_system_test_case'

class Admin::ApprovalsTest < ApplicationSystemTestCase
  test 'admin deletes an upload' do
    sign_in_admin

    click_on 'Löschen', match: :first

    assert_selector '.flash-success', text: 'Beitrag gelöscht'
  end
end
