class TeamMemberPresenter < Optimadmin::BasePresenter
  presents :team_member

  def id
    team_member.id
  end

  def name
    team_member.name
  end

  def image
    h.image_tag team_member.image.index, alt: name
  end

  def job_title
    team_member.job_title
  end
end
