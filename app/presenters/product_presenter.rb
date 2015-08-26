class ProductPresenter < BasePresenter
  presents :product

  def id
    product.id
  end

  def title
    product.title
  end

  def link
    product
  end
  
  def summary
    h.raw product.summary
  end

  def image
    h.image_tag product.image.show, alt: title
  end
end
