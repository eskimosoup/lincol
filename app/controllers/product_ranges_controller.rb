class ProductRangesController < ApplicationController
  before_action :set_product_range, only: :show

  def index
    @static_page_menu_items = Optimadmin::Link.related_menu_items('Product Ranges', @industry.menu)
  end

  def show
    @static_page_menu_items = Optimadmin::Link.related_menu_items('Product Ranges', @industry.menu)
    return redirect_to @product_range_object, status: :moved_permanently if request.path != product_range_path(@product_range_object)
  end

  def technical_specification_downloads
    @static_page_menu_items = Optimadmin::Link.related_menu_items('Technical Specification Downloads', @industry.menu)
    @products = Product.technical_specification_downloads.group_by(&:product_range)
  end

  private

    def set_product_range
      @product_range_object = ProductRange.find(params[:id])
      @product_range = ProductRangePresenter.new(object: @product_range_object, view_template: view_context)
    end
end
