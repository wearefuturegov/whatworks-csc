class OurResearchPartnersController < PagesController
  include ContentfulController

  append_before_action :load_additional_content

  def show; end

  def params
    super.merge(section_id: 'about-us', id: 'our-research-partners')
  end

  private

  def load_additional_content
    @research_partners = ResearchPartner.all.load
  end

end
