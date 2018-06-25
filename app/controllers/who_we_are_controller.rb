class WhoWeAreController < PagesController
  include ContentfulController
  
  append_before_action :load_additional_content
  
  def show; end
  
  def params
    super.merge(section_id: 'about-us', id: 'who-we-are')
  end
  
  private
  
  def load_additional_content
    @board_members = BoardMember.all.load
    @team_members = TeamMember.all.load
    @stakeholder_panels = StakeholderPanel.all.load
  end
  
end
