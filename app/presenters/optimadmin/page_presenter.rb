module Optimadmin
  class PagePresenter < Optimadmin::BasePresenter
    presents :page

    def id
      page.id
    end

    def title
      page.title
    end

    def industry
      page.industry.name if page.industry.present?
    end

    def content
      h.raw page.content
    end
  end
end
