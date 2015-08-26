class IndustryBanner < ActiveRecord::Base
  mount_uploader :image, IndustryBannerUploader

  belongs_to :industry


  def self.industry_filter(industry_id)
    if industry_id.blank?
      where("true")
    else
      where(industry_id: industry_id)
    end
  end
end
