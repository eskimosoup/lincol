class ProductsController < ApplicationController
  before_action :set_product

  def show
    return redirect_to product_range_product_path(@product_range_object, @product_object), status: :moved_permanently if request.path != product_range_product_path(@product_range_object, @product_object)
  end

  private

    def set_product
      @product_range_object = ProductRange.find(params[:product_range_id])
      @product_object = Product.find(params[:id])
      @product = ProductPresenter.new(object: @product_object, view_template: view_context)
      @product_range = ProductRangePresenter.new(object: @product_range_object, view_template: view_context)
    end
end
