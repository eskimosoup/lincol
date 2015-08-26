module Optimadmin
  class TeamMemberPresenter < Optimadmin::BasePresenter
    presents :team_member

    def id
      team_member.id
    end

    def name
      team_member.name
    end
  end
end
