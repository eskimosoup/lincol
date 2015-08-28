class PagesController < ApplicationController
  before_action :set_page

  def show
    @industry = IndustryPresenter.new(object: @page.industry, view_template: view_context) if @industry.blank? && @page.industry.present?
    @presented_page = PagePresenter.new(object: @page, view_template: view_context)
    return redirect_to @page, status: :moved_permanently if request.path != page_path(@page)
    render layout: @page.layout
  end

  private

    def set_page
      @page = Page.find(params[:id])
    end
end
