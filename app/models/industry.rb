class Industry < ActiveRecord::Base
  mount_uploader :image, IndustryUploader

  COLOURS = %w( blue )
  DEFAULT_COLOUR = 'yellow'

  validates :name, :image, presence: true
  validates :subdomain, uniqueness: true, presence: true

  scope :displayable, -> { where(display: true) }

  has_many :industry_banners, dependent: :destroy
end
