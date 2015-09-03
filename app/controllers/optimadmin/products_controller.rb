module Optimadmin
  class ProductsController < Optimadmin::ApplicationController
    #before_action :set_product_range, except: [:create, :edit, :update, :destroy]
    before_action :set_product_range, only: [:index, :show, :new]
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    edit_images_for Product, [[:image, { show: ['fill', 203, 164], full: ['fit', 960, 480] }]]

    def index
      @products = Optimadmin::BaseCollectionPresenter.new(collection: Product.where('title ILIKE ? AND product_range_id = ?', "#{params[:search]}%", @product_range.id).page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::ProductPresenter)
    end

    def show
    end

    def new
      @product = Product.new(product_range_id: @product_range.id)
    end

    def edit
      @product_range = @product.product_range
    end

    def create
      @product = Product.new(product_params)
      @product_range = ProductRange.find(product_params[:product_range_id])
      if @product.save
        redirect_to products_url(product_range_id: @product_range.id), notice: 'Product was successfully created.'
      else
        render :new
      end
    end

    def update
      @product_range = @product.product_range
      if @product.update(product_params)
        redirect_to products_url(product_range_id: @product_range.id), notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @product_range = @product.product_range
      @product.destroy
      redirect_to products_url(product_range_id: @product_range.id), notice: 'Product was successfully destroyed.'
    end

  private
    def set_product_range
      @product_range = ProductRange.find(params[:product_range_id])
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :summary, :description, :technical_specification, :remove_technical_specification, :remote_technical_specification_url,
                                      :image, :remove_image, :remote_image_url, :image_cache, :video_url, :product_range_id, :display, :suggested_url, :home_highlight)
    end
  end
end
