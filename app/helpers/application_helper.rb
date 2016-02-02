module ApplicationHelper
  def two_tone_title(title)
    size = title.scan(/[\w-]+/).size

    if size > 1
      length = size - 1
      first_word  = title.split(' ').first
      last_words = title.split(' ')[1..length].join(' ')
      "<span class='first-word-emphasis'>#{first_word}</span> #{last_words}".html_safe
    else
      "<span class='first-word-emphasis'>#{title}</span>".html_safe
    end
  end

  def logo_link(industry)
    link_to "http://#{Rails.application.routes.default_url_options[:host]}", title: global_site_settings['Name'], class: 'logo-link' do
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
      when 'callback'
        'callback_form'
      when 'download'
        'download_form'
      when 'general_download'
        'general_download_form'
      else
        'form'
      end
  end
end
