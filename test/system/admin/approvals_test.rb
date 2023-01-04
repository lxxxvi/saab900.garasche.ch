require "application_system_test_case"

class Admin::ApprovalsTest < ApplicationSystemTestCase
  test "admin approves an image upload" do
    upload_file("test/fixtures/files/image.png")
    upload = Upload.last

    sign_in_admin

    visit edit_admin_upload_path(upload)

    assert_link "Zurück"

    assert_selector "label", text: "Beschreibung"
    fill_in "Beschreibung", with: "Beschreibung"

    assert_selector "label", text: "Publizieren"
    check "Publizieren"

    click_on "Editieren"

    assert_selector ".flash-success", text: "Beitrag editiert"
  end
end
