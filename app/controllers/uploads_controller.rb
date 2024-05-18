class UploadsController < ApplicationController
  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)

    if @upload.save
      flash[:notice] = t(".notice")
      redirect_to root_path
    else
      Bugsnag.notify(@upload.errors.to_a)
      flash[:alert] = t(".alert")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def upload_params
    return unless params.include?(:upload)

    params.require(:upload).permit(:file)
  end
end
