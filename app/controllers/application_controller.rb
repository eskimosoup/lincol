class ApplicationController < ActionController::Base

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: -> { render_error(500) }
    rescue_from ActiveRecord::RecordNotFound, with: -> { render_error(404) }
    rescue_from ActionController::RoutingError, with: -> { render_error(404) }
  end

  def render_error(status)
    respond_to do |format|
      format.html { render "errors/#{status}", status: status }
      format.all { render nothing: true, status: status }
    end
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :global_site_settings, :load_industry, :load_objects

  def index
    if @industry.present?
      @static_page_menu_items = Optimadmin::Link.related_menu_items('Product Ranges', @industry.menu)
      render 'industries/show'
    end
    @industries = BaseCollectionPresenter.new(collection: Industry.displayable, view_template: view_context, presenter: IndustryPresenter) unless @industry.present?
  end

  def general_downloads
    @static_page_menu_items = Optimadmin::Link.related_menu_items('General Information Download Centre', @industry.menu)
    @additional_content = AdditionalContentPresenter.new(object: AdditionalContent.find_by(area: 'General Information Download Centre'), view_template: view_context)
    @general_downloads = @unpresented_industry.general_downloads.displayable if @industry.present?
  end

  private

    def load_industry
      @unpresented_industry = Industry.displayable.find_by_subdomain(request.domain(3)) if Rails.env.production?
      @unpresented_industry = Industry.displayable.find(3) if Rails.env.development?
      #industry = Industry.displayable.find(7) if Rails.env.development?
      if @unpresented_industry.present?
        @industry = IndustryPresenter.new(object: @unpresented_industry, view_template: view_context)
        @header_menu = Optimadmin::Menu.new(name: @industry.menu)
      else
        @header_menu = Optimadmin::Menu.new(name: "header")
      end
    end

    def load_objects
      @contact = Contact.new
      @footer_menu = Optimadmin::Menu.new(name: "footer")
    end

    def global_site_settings
      @global_site_settings ||= Optimadmin::SiteSetting.current_environment
    end
    helper_method :global_site_settings
end
