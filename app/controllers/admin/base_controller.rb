class Admin::BaseController < ApplicationController
  include Admin::SessionsHelper

  layout "admin/layouts/application"
  before_action :authenticate_admin

  private

  def authenticate_admin
    return if admin_signed_in?

    flash[:notice] = t("admin.sessions.login_first")
    redirect_to new_admin_session_path
  end
end
