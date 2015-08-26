class ProductRange < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, ProductUploader

  validates :title, :summary, :industry, :image, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: { message: 'is not unique, leave this blank to generate automatically' }

  belongs_to :industry
  has_many :products, dependent: :destroy

  scope :displayable, -> { where(display: true) }
  scope :home_highlight, -> { where(home_highlight: true).displayable.order(:title) }

  def self.industry_filter(industry_id)
    if industry_id.blank?
      where('true')
    else
      where(industry_id: industry_id)
    end
  end

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
