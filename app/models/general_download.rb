class GeneralDownload < ActiveRecord::Base
  include NormalizeBlankValues

  mount_uploader :file, Optimadmin::DocumentUploader
  mount_uploader :image, ProductUploader

  validates :title, :file, :image, :industry, presence: true

  belongs_to :industry

  scope :positioned, -> { order("title ASC") }
  scope :displayable, -> { where(display: true).positioned }
end
