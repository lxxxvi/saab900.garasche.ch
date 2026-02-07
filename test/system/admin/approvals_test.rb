require "application_system_test_case"

class Admin::ApprovalsTest < ApplicationSystemTestCase
  test "admin approves an image upload" do
    upload_file("test/fixtures/files/image.png")

    sign_in_admin

    assert_selector ".statistics--published-count", text: "0 publizierte Beiträge"
    assert_selector ".statistics--not-published-count", text: "4 nicht publizierte Beiträge"

    within ".upload", match: :first do
      click_button "Publizieren"
    end

    assert_selector ".statistics--published-count", text: "1 publizierter Beitrag"

    within ".upload", text: "Unpublizieren" do
      click_button "Unpublizieren"
    end

    assert_selector ".statistics--published-count", text: "0 publizierte Beiträge"
  end
end
