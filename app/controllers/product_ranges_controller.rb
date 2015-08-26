class ProductRangesController < ApplicationController
  before_action :set_product_range

  def show
  end

  private

    def set_product_range
      product_range = ProductRange.find(params[:id])
      @product_range = ProductRangePresenter.new(object: product_range, view_template: view_context)
    end
end
