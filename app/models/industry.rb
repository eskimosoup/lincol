class Industry < ActiveRecord::Base
  mount_uploader :image, IndustryUploader

  mount_uploader :home_banner_image, IndustryHomeBannerUploader

  COLOURS = %w( blue red )
  DEFAULT_COLOUR = 'yellow'

  validates :name, :image, presence: true
  validates :subdomain, uniqueness: true, presence: true

  has_many :industry_banners, dependent: :destroy
  has_many :product_ranges, dependent: :destroy
  has_many :pages, dependent: :destroy
  has_many :frequently_asked_questions, dependent: :destroy
  has_many :general_downloads, dependent: :destroy

  scope :ordered, -> { order(:position) }
  scope :displayable, -> { where(display: true).ordered }
end
