class TeamMembersController < ApplicationController
  def index
    @additional_content = AdditionalContentPresenter.new(object: AdditionalContent.find_by(area: 'Team Members index'), view_template: view_context)
    @team_members = BaseCollectionPresenter.new(collection: TeamMember.displayable, view_template: view_context, presenter: TeamMemberPresenter)
  end
end
