class MeetTheTeamController < PagesController
  include ContentfulController

  append_before_action :load_additional_content

  def show; end

  def params
    super.merge(section_id: 'about-us', id: 'meet-the-team')
  end

  private

  def load_additional_content
    @team_members = TeamMember.all.load
  end

end
