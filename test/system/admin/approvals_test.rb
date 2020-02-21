require 'application_system_test_case'

class Admin::ApprovalsTest < ApplicationSystemTestCase
  test 'admin approves an image upload' do
    sign_in_admin

    click_on 'Annehmen', match: :first
    assert_selector 'label', text: 'Beschreibung'
    assert_link 'Zurück'
    fill_in 'Beschreibung', with: 'Beschreibung'
    click_on 'Annehmen'

    assert_selector '.flash-success', text: 'Beitrag angenommen'
  end
end
