require 'test_helper'

class Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'login successful' do
    sign_in_admin
    assert_equal 'Login erfolgreich', flash[:success]
  end

  test 'login fails' do
    post admin_session_path, params: { password: 'wrong' }
    assert_response :success

    assert_equal 'Login fehlgeschlagen', flash[:alert]
  end
end
