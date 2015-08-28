class ProductPresenter < BasePresenter
  presents :product

  def id
    product.id
  end

  def title
    product.title
  end

  def description
    h.raw product.description
  end

  def link
    product
  end

  def download_verified(text = 'Click here to download')
    h.link_to text, product.technical_specification.url, target: '_blank', class: 'product-technical-specification-download'
  end

  def download_technical_specification(text = 'Download The Technical Specification File')
    h.link_to text, h.download_form_contacts_path(id: id), class: 'product-technical-specification-download colorbox-iframe'
  end

  def product_range
    product.product_range
  end

  def summary
    h.raw product.summary
  end

  def image(crop = 'show')
    h.image_tag product.image.send(crop), alt: title
  end

  def image_url(crop = 'show')
    product.image.send(crop).url
  end

  def colorbox_image
    h.link_to product.image.full.url, title: title, class: 'colorbox product-range' do
      h.content_tag :div, image, class: 'product-range-content'
    end
  end

  def has_video?
    product.video_url.present? ? true : false
  end

  def show_video
    h.content_tag :div do
      h.raw display_video(product.video_url, 400, 0, false)
    end
  end

  private
    def display_video(video_embed, width, height, autoplay = false)
      if height.zero?
        height = width.to_i / 16
        height = height * 9
      end

      if autoplay == false
        "<iframe width=\"#{width}\" height=\"#{height}\" src=\"http://www.youtube.com/embed/#{video_embed.split("=").last}\" frameborder=\"0\" allowfullscreen></iframe>"
      else
        "<iframe width=\"#{width}\" height=\"#{height}\" src=\"http://www.youtube.com/embed/#{video_embed.split("=").last}?autoplay=1\" frameborder=\"0\" allowfullscreen></iframe>"
      end
    end
end
