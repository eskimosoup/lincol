module Optimadmin
  class IndustryBannerPresenter < Optimadmin::BasePresenter
    presents :industry_banner

    def id
      industry_banner.id
    end

    def title
      industry_banner.title
    end

    def industry
      industry_banner.industry.name if industry_banner.industry.present?
    end
  end
end
