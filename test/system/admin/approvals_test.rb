require 'application_system_test_case'

class Admin::ApprovalsTest < ApplicationSystemTestCase
  test 'admin approves an upload' do
    sign_in_admin

    click_on 'Annehmen', match: :first

    assert_selector '.flash-success', text: 'Beitrag angenommen'
  end
end
