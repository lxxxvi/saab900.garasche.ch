class Admin::Uploads::ApprovalsController < Admin::BaseController
  def create
    find_upload.approve!
    flash[:success] = t('.success')
    redirect_to admin_uploads_path(display: :review)
  end

  private

  def find_upload
    @find_upload ||= Upload.for_review.find(params[:upload_id])
  end
end
