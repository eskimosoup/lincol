class AdditionalContent < ActiveRecord::Base
  AREAS = [
              'Team Members index',
              'Frequently Asked Questions index'
            ]


  validates :content, presence: true
  validates :area, uniqueness: true, presence: true
end
