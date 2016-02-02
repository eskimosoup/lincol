module Optimadmin
  class GeneralDownloadsController < Optimadmin::ApplicationController
    before_action :set_general_download, only: [:show, :edit, :update, :destroy]

    edit_images_for GeneralDownload, [[:image, { show: ['fill', 203, 164], full: ['fit', 960, 480] }]]

    def index
      @general_downloads = Optimadmin::BaseCollectionPresenter.new(collection: GeneralDownload.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::GeneralDownloadPresenter)
    end

    def show
    end

    def new
      @general_download = GeneralDownload.new
    end

    def edit
    end

    def create
      @general_download = GeneralDownload.new(general_download_params)
      if @general_download.save
        redirect_to_index_or_continue_editing(@general_download)
      else
        render :new
      end
    end

    def update
      if @general_download.update(general_download_params)
        redirect_to_index_or_continue_editing(@general_download)
      else
        render :edit
      end
    end

    def destroy
      @general_download.destroy
      redirect_to general_downloads_url, notice: 'General download was successfully destroyed.'
    end

  private


    def set_general_download
      @general_download = GeneralDownload.find(params[:id])
    end

    def general_download_params
      params.require(:general_download).permit(:title, :file, :remove_file, :remote_file_url,
                                      :image, :remove_image, :remote_image_url, :image_cache, :industry_id, :display)
    end
  end
end
