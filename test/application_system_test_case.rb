require "test_helper"
require "capybara/rails"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include ActionDispatch::TestProcess::FixtureFile

  driven_by :rack_test

  teardown do
    sign_out if find_all("a", text: "Ausloggen").any?
  end

  def sign_in_admin
    visit admin_root_path
    fill_in "Passwort", with: "admin"
    click_button "Einloggen"
  end

  def sign_out
    click_button "Ausloggen"
  end

  def upload_file(path)
    visit new_upload_path
    attach_file "Bild auswählen", Rails.root.join(path)
    click_button "Hochladen"
  end
end
