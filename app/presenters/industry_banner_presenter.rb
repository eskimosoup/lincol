class IndustryBannerPresenter < Optimadmin::BasePresenter
  presents :industry_banner

  def content
    h.raw industry_banner.content
  end

  def more_text
    industry_banner.more_text
  end

  def more_link
    industry_banner.more_link
  end

  def more_linked_text
    h.link_to more_text, industry_banner.more_link, title: more_text, class: 'industry-banner-more-linked-text' if industry_banner.more_link?
  end

  def button_text
    industry_banner.button_text
  end

  def banner_image
    if industry_banner.image? && industry_banner.more_link.present?
      linked_image
    elsif industry_banner.image? && industry_banner.more_link.blank?
      unlinked_image
    end
  end

  private

    def linked_image
      h.link_to more_link, title: industry_banner.button_text do
        unlinked_image
      end
    end

    def unlinked_image
      h.image_tag industry_banner.image.show, alt: industry_banner.button_text, class: 'industry-banner-image'
    end
end
