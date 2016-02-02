module Optimadmin
  class GeneralDownloadPresenter < Optimadmin::BasePresenter
    presents :general_download
    delegate :id, to: :general_download

    def title
      general_download.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      #h.simple_format general_download.summary
      h.link_to 'View file', general_download.file.url, target: '_blank'
    end
  end
end
