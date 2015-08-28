class Product < ActiveRecord::Base
  include NormalizeBlankValues
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, ProductUploader
  mount_uploader :technical_specification, Optimadmin::DocumentUploader

  validates :title, :summary, :description, :image, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: { message: 'is not unique, leave this blank to generate automatically' }

  belongs_to :product_range, counter_cache: true

  scope :displayable, -> { where(display: true).order(:title) }
  scope :technical_specification_downloads, -> { where("technical_specification IS NOT NULL").displayable }

  def slug_candidates
    [
      :suggested_url,
      :title,
      [:suggested_url, :title]
    ]
  end

  def should_generate_new_friendly_id?
    suggested_url_changed? || title_changed?
  end
end
