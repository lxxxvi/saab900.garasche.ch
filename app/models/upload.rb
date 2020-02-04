class Upload < ApplicationRecord
  mount_uploader :file, FileUploader

  validates :file, presence: true

  scope :approved, -> { where.not(approved_at: nil) }
  scope :for_review, -> { where(approved_at: nil) }
  scope :ordered_chronologically, -> { order(approved_at: :desc) }

  before_destroy :delete_file

  def approve!
    update(approved_at: Time.zone.now)
  end

  def delete_file
    file.file.delete
  end
end
