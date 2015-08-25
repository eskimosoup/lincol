class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :global_site_settings, :load_industry, :load_objects

  def index
    render 'industry/show' if @industry.present?
  end

  private

    def load_industry
      begin
        industry = Industry.displayable.find_by_subdomain(request.domain(3)) if Rails.env.production?
        industry = Industry.displayable.find(100) if Rails.env.development?
        @industry = IndustryPresenter.new(object: industry, view_template: view_context)
        @header_menu = Optimadmin::Menu.new(name: @industry.menu)
      rescue
        @header_menu = Optimadmin::Menu.new(name: "header")
      end
      @footer_menu = Optimadmin::Menu.new(name: "footer")
    end

    def load_objects
      @contact = Contact.new
    end

    def global_site_settings
      @global_site_settings ||= Optimadmin::SiteSetting.current_environment
    end
    helper_method :global_site_settings
end
