class Admin::UploadsController < Admin::BaseController
  include Pagy::Backend

  def index
    @pagy, @records = pagy(find_uploads)
  end

  private

  def find_uploads
    scope = Upload.order(created_at: :desc)

    return scope.for_review if params[:display] == 'review'

    scope.approved
  end
end
