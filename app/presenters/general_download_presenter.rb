class GeneralDownloadPresenter < BasePresenter
  presents :general_download

  def id
    general_download.id
  end

  def title
    general_download.title
  end

  def download_verified(text = 'Click here to download')
    h.link_to text, general_download.file.url, target: '_blank', class: 'product-technical-specification-download'
  end

  def download_file(text = 'Download The Technical Specification File')
    h.link_to text, h.general_download_form_contacts_path(id: id),
              class: 'product-technical-specification-download colorbox-iframe' if product.technical_specification.present?
  end

  def image(crop = 'show')
    h.image_tag general_download.image.send(crop), alt: title
  end
end
