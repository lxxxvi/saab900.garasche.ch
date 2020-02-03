class Admin::UploadsController < Admin::BaseController
  include Pagy::Backend

  def index
    @pagy, @records = pagy(find_uploads)
  end

  def destroy
    find_upload.destroy!
    flash[:success] = 'Deleted'
    redirect_to admin_uploads_path
  end

  private

  def find_uploads
    scope = Upload.order(created_at: :desc)

    return scope.for_review if params[:display] == 'review'

    scope.approved
  end

  def find_upload
    @find_upload ||= Upload.find(params[:id])
  end
end
