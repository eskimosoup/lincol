class IndustryPresenter < BasePresenter
  presents :industry

  def name
    industry.name
  end

  def accreditations
    h.raw industry.accreditations
  end

  def link
    "http://#{industry.subdomain}"
  end

  def menu
    industry.menu
  end

  def home_link
    h.content_tag :li, (h.link_to 'Home', link, title: name, class: "menu-link level-1 #{'active' if h.request.path == '/'}")
  end

  def image(crop = 'show')
    h.image_tag industry.image.send(crop), alt: industry.name if industry.image?
  end

  def background_image(crop = 'show')
    industry.home_banner_image.send(crop)
  end

  def colour
    industry.colour.present? ? industry.colour : Industry::DEFAULT_COLOUR
  end

  def home_highlight_product_ranges
    industry.product_ranges.home_highlight
  end

  def displayable_product_ranges
    industry.product_ranges.displayable
  end

  def displayable_banners
    industry.industry_banners.displayable
  end

  def displayable_frequently_asked_questions
    industry.frequently_asked_questions.displayable
  end

  def home_highlight_products
    industry.product_ranges.home_highlight.first.products.home_highlight
  end

  def summary
    h.simple_format industry.summary
  end

  def introduction
    h.raw industry.introduction
  end
end
