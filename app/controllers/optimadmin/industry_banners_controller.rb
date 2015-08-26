module Optimadmin
  class IndustryBannersController < Optimadmin::ApplicationController
    before_action :set_industry_banner, only: [:show, :edit, :update, :destroy]

    edit_images_for IndustryBanner, [[:image, { show: ['fill', 369, 227] }]]

    def index
      @industry_banners = Optimadmin::BaseCollectionPresenter.new(collection: IndustryBanner.where('title ILIKE ?', "#{params[:search]}%").industry_filter(params[:industry_id]).ordered.page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::IndustryBannerPresenter)
    end

    def show
    end

    def new
      @industry_banner = IndustryBanner.new
    end

    def edit
    end

    def create
      @industry_banner = IndustryBanner.new(industry_banner_params)
      if @industry_banner.save
        redirect_to industry_banners_url, notice: 'Industry banner was successfully created.'
      else
        render :new
      end
    end

    def update
      if @industry_banner.update(industry_banner_params)
        redirect_to industry_banners_url, notice: 'Industry banner was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @industry_banner.destroy
      redirect_to industry_banners_url, notice: 'Industry banner was successfully destroyed.'
    end

  private


    def set_industry_banner
      @industry_banner = IndustryBanner.find(params[:id])
    end

    def industry_banner_params
      params.require(:industry_banner).permit(:title, :content, :button_text, :display, :more_text, :more_link, :image,  :image, :image_cache, :remote_image_url, :remove_image, :industry_id)
    end
  end
end
