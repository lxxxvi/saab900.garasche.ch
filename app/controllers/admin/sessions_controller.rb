class Admin::SessionsController < Admin::BaseController
  skip_before_action :authenticate_admin
  before_action :redirect_to_admin_root_path, if: :admin_signed_in?, except: %i[destroy]

  def new
  end

  def create
    if params.present? && params[:password] == Rails.configuration.admin_password
      session[:admin_signed_in] = true
      redirect_to admin_root_path
    else
      flash.now[:error] = 'That was wrong, try again'
      render :new
    end
  end

  def destroy
    session[:admin_signed_in] = nil
    redirect_to new_admin_session_path
  end

  private

  def redirect_to_admin_root_path
    redirect_to admin_root_path
  end
end
