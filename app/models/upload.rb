class Upload < ApplicationRecord
  mount_uploader :file, FileUploader

  validates :file, presence: true

  scope :published, -> { where.not(published_at: nil) }
  scope :publishable, -> { where(published_at: nil) }
  scope :ordered_chronologically, -> { order(published_at: :desc, created_at: :desc) }

  before_destroy :delete_file

  def publishable?
    published_at.nil?
  end

  def published?
    published_at.present?
  end



  def delete_file
    file.file.delete
  end
end
