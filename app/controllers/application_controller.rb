class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :global_site_settings, :load_industry, :load_objects

  def index
    render 'industries/show' if @industry.present?
    @industries = BaseCollectionPresenter.new(collection: Industry.displayable, view_template: view_context, presenter: IndustryPresenter) unless @industry.present?
  end

  private

    def load_industry
      industry = Industry.displayable.find_by_subdomain(request.domain(3)) if Rails.env.production?
      industry = Industry.displayable.find(3) if Rails.env.development?
      #industry = Industry.displayable.find(7) if Rails.env.development?
      if industry
        @industry = IndustryPresenter.new(object: industry, view_template: view_context)
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
