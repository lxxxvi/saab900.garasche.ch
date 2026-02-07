class Admin::UploadsController < Admin::BaseController
  include Pagy::Method

  before_action :set_upload, only: %w[edit update destroy]

  def index
    @upload_statistics = Upload::Statistics.call
    @pagy, @records = pagy(Upload.ordered_chronologically)
  end

  def edit
    @upload_form = Admin::UploadForm.new(@upload)
  end

  def update
    @upload_form = Admin::UploadForm.new(@upload, admin_upload_params)

    if @upload_form.save
      redirect_to admin_uploads_path
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @upload.destroy!
    redirect_to admin_uploads_path
  end

  private

  def set_upload
    @upload = Upload.find(params[:id])
  end

  def admin_upload_params
    params.expect(admin_upload: [:title, :comment, :publish])
  end
end
