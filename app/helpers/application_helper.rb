module ApplicationHelper
  def logo_link(industry)
    link_to (image_tag "layout/header/logo-#{industry.present? ? industry.colour : Industry::DEFAULT_COLOUR}.png", alt: global_site_settings['Name']), (industry.present? ? industry.link : root_url), title: global_site_settings['Name'] 
  end
end
