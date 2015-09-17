class Page < ActiveRecord::Base
  include MenuResourceable
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, PageUploader

  before_save :store_image, if: Proc.new{|page| page.remote_image_url.blank? }
  # before_save :store_file, if: Proc.new{|page| page.remote_file_url.blank? }

  belongs_to :industry

  validates :title, :content, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: { message: 'is not unique, leave this blank to generate automatically' }

  before_save :update_page_name

  def update_page_name
    if self.industry.present?
      self.name = "#{self.title} (#{self.industry.name})"
    else
      self.name = self.title
    end
  end

  def slug_candidates
    [
      :suggested_url,
      :title,
      [:suggested_url, :title]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || title_changed?
  end

  def route
    "{:controller => '/pages', :action => 'show', :id => '#{self.slug}'}"
  end

  def self.layouts
    %w{ application }
  end

  def self.styles
    %w{ basic }
  end

  def store_image
    Optimadmin::Image.store_image(self, image) if image.present? && image_changed?
  end

  def self.industry_filter(industry_id)
    if industry_id.blank?
      where("true")
    else
      where(industry_id: industry_id)
    end
  end

  # def store_file
  #   Optimadmin::Document.store_file(self, file) if file.present? && file_changed?
  # end
end
