class Admin::UploadForm
  include ActiveModel::Model

  PDF_FILE_EXTENSION = ".pdf".freeze

  delegate :persisted?, :new_record?, :to_param, :publishable?, to: :object
  attr_reader :object, :params, :file, :title, :comment, :publish

  validates :title, presence: true, if: :pdf?

  def initialize(object, params = {})
    @object = object
    @title = params[:title] || object.title
    @comment = params[:comment] || object.comment
    @publish = params[:publish] || object.published?
  end

  def save
    return unless valid?

    object.title = title
    object.comment = comment
    update_published_at
    object.save
  end

  def model_name
    ActiveModel::Name.new(self, nil, "Admin::Upload")
  end

  def title_required?
    pdf?
  end

  def pdf?
    object.file.file.filename.downcase.end_with?(PDF_FILE_EXTENSION)
  end

  private

  def publish?
    publish == "1"
  end

  def determine_published_at
    return nil unless publish?

    object.published_at || Time.zone.now
  end

  def update_published_at
    object.published_at = determine_published_at
  end
end
