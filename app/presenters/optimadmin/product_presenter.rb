module Optimadmin
  class ProductPresenter < Optimadmin::BasePresenter
    presents :product

    def id
      product.id
    end

    def title
      product.title
    end

    def product_range_id
      product.product_range.id
    end
  end
end
