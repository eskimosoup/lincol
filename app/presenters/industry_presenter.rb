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

  def image(crop = 'show')
    h.image_tag industry.image.send(crop), alt: industry.name if industry.image?
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
end
