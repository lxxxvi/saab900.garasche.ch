class Admin::UploadsController < Admin::BaseController
  include Pagy::Backend
  before_action :set_upload, only: %w[edit update destroy]

  def index
    @pagy, @records = pagy(Upload.ordered_chronologically)
  end

  def edit
    @upload_form = Admin::UploadForm.new(@upload)
  end

  def update
    @upload_form = Admin::UploadForm.new(@upload, admin_upload_params)

    if @upload_form.save
      flash[:success] = t(".success")
      redirect_to admin_uploads_path
    else
      flash.now[:alert] = t(".alert")
      render :edit
    end
  end

  def destroy
    @upload.destroy!
    flash[:success] = t(".success")
    redirect_to admin_uploads_path
  end

  private

  def set_upload
    @upload = Upload.find(params[:id])
  end

  def admin_upload_params
    params.require(:admin_upload).permit(:title, :comment, :publish)
  end
end
