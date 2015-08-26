class ProductRangePresenter < Optimadmin::BasePresenter
  presents :product_range

  def id
    product_range.id
  end

  def title
    product_range.title
  end

  def link
    product_range
  end

  def image
    h.image_tag product_range.image.show, title: product_range.title
  end

  def displayable_products
    product_range.products.displayable
  end
end
