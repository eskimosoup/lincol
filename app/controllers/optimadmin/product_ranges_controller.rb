module Optimadmin
  class ProductRangesController < Optimadmin::ApplicationController
    before_action :set_product_range, only: [:show, :edit, :update, :destroy]

    edit_images_for ProductRange, [[:image, { show: ['fill', 203, 164] }]]

    def index
      @product_ranges = Optimadmin::BaseCollectionPresenter.new(collection: ProductRange.industry_filter(params[:industry_id]).where('title ILIKE ?', "#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::ProductRangePresenter)
    end

    def show
    end

    def new
      @product_range = ProductRange.new
    end

    def edit
    end

    def create
      @product_range = ProductRange.new(product_range_params)
      if @product_range.save
        redirect_to product_ranges_url, notice: 'Product range was successfully created.'
      else
        render :new
      end
    end

    def update
      if @product_range.update(product_range_params)
        redirect_to product_ranges_url, notice: 'Product range was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @product_range.destroy
      redirect_to product_ranges_url, notice: 'Product range was successfully destroyed.'
    end

  private


    def set_product_range
      @product_range = ProductRange.find(params[:id])
    end

    def product_range_params
      params.require(:product_range).permit(:title, :summary, :image, :image_cache, :remote_image_url, :remove_image, :suggested_url, :industry_id, :home_highlight, :display)
    end
  end
end
