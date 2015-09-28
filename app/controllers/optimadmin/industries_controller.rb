module Optimadmin
  class IndustriesController < Optimadmin::ApplicationController
    before_action :set_industry, only: [:show, :edit, :update, :destroy]

    edit_images_for Industry, [[:image, { header: ['fill', 811, 163] }], [:home_banner_image, { homepage: ['fit', 440, 186] }]]

    def index
      @industries = Optimadmin::BaseCollectionPresenter.new(collection: Industry.ordered.where('name ILIKE ?', "#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::IndustryPresenter)
    end

    def show
    end

    def new
      @industry = Industry.new
    end

    def edit
    end

    def create
      @industry = Industry.new(industry_params)
      if @industry.save
        redirect_to industries_url, notice: 'Industry was successfully created.'
      else
        render :new
      end
    end

    def update
      if @industry.update(industry_params)
        redirect_to industries_url, notice: 'Industry was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @industry.destroy
      redirect_to industries_url, notice: 'Industry was successfully destroyed.'
    end

  private


    def set_industry
      @industry = Industry.find(params[:id])
    end

    def industry_params
      params.require(:industry).permit(:name, :summary, :image, :remove_image, :image_cache, :remote_image_url, :home_banner_image, :remove_home_banner_image, :home_banner_image_cache, :remote_home_banner_image_url, :display, :colour, :position, :accreditations, :subdomain, :menu, :introduction)
    end
  end
end
