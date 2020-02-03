class Admin::BaseController < ApplicationController
  include Admin::SessionsHelper

  layout 'admin/layouts/application'
  before_action :authenticate_admin

  private

  def authenticate_admin
    return redirect_to new_admin_session_path unless admin_signed_in?
  end
end
