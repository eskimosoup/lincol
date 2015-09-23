class IndustryBanner < ActiveRecord::Base
  mount_uploader :image, IndustryBannerUploader
  mount_uploader :home_banner_image, IndustryHomeBannerUploader

  validates :title, :button_text, :content, :industry, presence: true

  belongs_to :industry

  scope :ordered, -> { order(:position) }
  scope :displayable, -> { where(display: true).ordered }

  def self.industry_filter(industry_id)
    if industry_id.blank?
      where('true')
    else
      where(industry_id: industry_id)
    end
  end
end
