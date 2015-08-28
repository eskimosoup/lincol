module Optimadmin
  class PagesController < Optimadmin::ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy]

    edit_images_for Page, [[:image, { show: ['fit', 723, 135], header: ['fill', 811, 163] }]]

    def index
      @pages = Optimadmin::BaseCollectionPresenter.new(collection: Page.industry_filter(params[:industry_id]).where('title ILIKE ?', "#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15).order(industry_id: :desc), view_template: view_context, presenter: Optimadmin::PagePresenter)
    end

    def show
    end

    def new
      @page = Page.new
    end

    def edit
    end

    def create
      @page = Page.new(page_params)
      if @page.save
        redirect_to pages_url, notice: 'Page was successfully created.'
      else
        render :new
      end
    end

    def update
      if @page.update(page_params)
        redirect_to pages_url, notice: 'Page was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @page.destroy
      redirect_to pages_url, notice: 'Page was successfully destroyed.'
    end

  private


    def set_page
      @page = Page.friendly.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :suggested_url, :image, :image_cache, :remove_image, :remote_image_url, :industry_id, :display, :content, :style, :layout)
    end
  end
end
