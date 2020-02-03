class UploadsController < ApplicationController
  def create
    upload = Upload.new(upload_params)

    if upload.save!
      flash.now[:success] = 'Upload erfolreich'
    else
      flash.now[:alert] = 'Irgendwas hat nicht geklappt'
    end

    redirect_to root_path
  end

  private

  def upload_params
    params.require(:upload).permit(:file)
  end
end
