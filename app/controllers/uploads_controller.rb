class UploadsController < ApplicationController
  def create
    upload = Upload.new(upload_params)

    if upload.save
      flash[:success] = t('.success')
    else
      flash[:alert] = t('.alert')
    end

    redirect_to root_path
  end

  private

  def upload_params
    params.require(:upload).permit(:file)
  end
end
