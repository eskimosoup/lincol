class TeamMember < ActiveRecord::Base
  mount_uploader :image, TeamMemberUploader

  validates :name, :image, :job_title, presence: true

  scope :ordered, -> { order(:position) }
  scope :displayable, -> { where(display: true).ordered }
end
