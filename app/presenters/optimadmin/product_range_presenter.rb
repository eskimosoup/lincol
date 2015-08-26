module Optimadmin
  class ProductRangePresenter < Optimadmin::BasePresenter
    presents :product_range

    def id
      product_range.id
    end

    def title
      product_range.title
    end

    def industry
      product_range.industry.name if product_range.industry.present?
    end

    def products
      h.link_to h.pluralize(product_range.products_count, "product"), h.products_path(product_range_id: product_range.id)
    end
  end
end
