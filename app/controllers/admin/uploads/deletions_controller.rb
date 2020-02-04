class Admin::Uploads::DeletionsController < Admin::BaseController
  def create
    find_upload.destroy!
    flash[:success] = 'Deleted'
    redirect_to admin_uploads_path
  end

  private

  def find_upload
    @find_upload ||= Upload.find(params[:upload_id])
  end
end
