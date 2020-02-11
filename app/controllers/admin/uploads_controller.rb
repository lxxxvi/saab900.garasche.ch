class Admin::UploadsController < Admin::BaseController
  include Pagy::Backend

  def index
    @pagy, @records = pagy(find_uploads)
  end

  private

  def find_uploads
    @find_uploads ||= Upload.order(created_at: :desc)
  end
end
