module Optimadmin
  class AdditionalContentPresenter < Optimadmin::BasePresenter
    presents :additional_content

    def id
      additional_content.id
    end

    def title
      additional_content.area
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.raw additional_content.content
    end
  end
end
