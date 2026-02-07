require "application_system_test_case"

class Admin::ApprovalsTest < ApplicationSystemTestCase
  test "admin deletes an upload" do
    sign_in_admin

    assert_selector ".statistics--not-published-count", text: "3 nicht publizierte Beiträge"

    click_button "Löschen", match: :first

    assert_selector ".statistics--not-published-count", text: "2 nicht publizierte Beiträge"
  end
end
