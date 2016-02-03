class AdditionalContent < ActiveRecord::Base
  AREAS = [
              'Team Members index',
              'Frequently Asked Questions index',
              'General Information Download Centre'
            ]


  # validates :content, presence: true
  validates :area, uniqueness: true, presence: true
end
