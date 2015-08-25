module Optimadmin
  class IndustryPresenter < Optimadmin::BasePresenter
    presents :industry

    def id
      industry.id
    end

    def name
      industry.name
    end

    def link
      "http://#{industry.subdomain}"
    end

    def view_industry_link
      h.link_to eye, link, class: 'menu-item-control'
    end
  end
end
