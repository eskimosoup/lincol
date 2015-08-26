module Optimadmin
  class ProductPresenter < Optimadmin::BasePresenter
    presents :product

    def id
      product.id
    end

    def title
      product.title
    end
  end
end
