class AdditionalContentPresenter < BasePresenter
  presents :additional_content

  def title(default_text = '')
    additional_content.present? ? additional_content.title : default_text
  end

  # used for industry header
  def name
    title
  end

  def content
    return unless additional_content.present?
    h.raw additional_content.content
  end
end
