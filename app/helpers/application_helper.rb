module ApplicationHelper
  def logo_link(industry)
    link_to (industry.present? ? industry.link : root_url), title: global_site_settings['Name'] do
      image_tag "layout/header/logo-#{industry.present? ? industry.colour : Industry::DEFAULT_COLOUR}.png", alt: global_site_settings['Name']
    end
  end

  def form_partial_helper(form_type)
    partial = form_type.gsub(' ', '_').downcase
    case partial
      when 'footer'
        'footer_form'
      when 'sidebar'
        'sidebar_form'
      else
        'form'
      end
  end
end
