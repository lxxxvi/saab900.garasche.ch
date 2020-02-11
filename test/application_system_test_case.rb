require 'test_helper'
require 'capybara/rails'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :rack_test

  teardown do
    sign_out if find_all('a', text: 'Ausloggen').any?
  end

  def sign_in_admin
    visit admin_root_path
    fill_in 'Passwort', with: 'admin'
    click_on 'Einloggen'
    assert_selector 'h1', text: 'Beiträge'
  end

  def sign_out
    click_on 'Ausloggen'
  end
end
