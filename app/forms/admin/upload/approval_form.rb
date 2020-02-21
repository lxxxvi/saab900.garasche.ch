class Admin::Upload::ApprovalForm
  include ActiveModel::Model

  PDF_FILE_EXTENSION = '.pdf'.freeze

  delegate :persisted, :new_record?, :to_param, to: :object
  attr_reader :object, :params, :file, :title

  validates :title, presence: true, if: :pdf?

  def initialize(object, params = {})
    @object = object
    @file, @title = params.values_at(:file, :title)
  end

  def save
    return unless valid?

    object.save
  end

  def model_name
    ActiveModel::Name.new(self, nil, 'Admin::Upload::Approval')
  end

  def to_url
    %i[admin upload approval]
  end

  def title_required?
    pdf?
  end

  private

  def pdf?
    object.file.file.filename.downcase.end_with?(PDF_FILE_EXTENSION)
  end
end
