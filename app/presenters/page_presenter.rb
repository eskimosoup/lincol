class PagePresenter < BasePresenter
  presents :page

  def title
    page.title
  end

  # used for industry header
  def name
    title
  end

  def content
    h.raw page.content
  end

  def image(crop = 'show')
    h.image_tag page.image.send(crop), alt: page.title if page.image?
  end
end
