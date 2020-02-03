class Saab900Controller < ApplicationController
  include Pagy::Backend

  def show
    @pagy, @records = pagy(Upload.approved.ordered_chronologically)
  end
end
