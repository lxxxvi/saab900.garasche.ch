class Saab900Controller < ApplicationController
  include Pagy::Backend

  def show
    @pagy, @records = pagy(Upload.published.ordered_chronologically, items: 10)
  end
end
