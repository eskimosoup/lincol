class FrequentlyAskedQuestion < ActiveRecord::Base
  belongs_to :industry

  validates :question, :answer, :industry, presence: true

  scope :ordered, -> { order(:position) }
  scope :displayable, -> { where(display: true) }

  def self.industry_filter(industry_id)
    if industry_id.blank?
      where('true')
    else
      where(industry_id: industry_id)
    end
  end
end
