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

  #def image
  #  h.image_tag page.image.show, alt: page.title, class: 'page-image image-right' if page.image?
  #end

  def colour
    industry.colour.present? ? industry.colour : Industry::DEFAULT_COLOUR
  end

end
