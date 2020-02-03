module Admin::SessionsHelper
  def admin_signed_in?
    session[:admin_signed_in] == true
  end
end
