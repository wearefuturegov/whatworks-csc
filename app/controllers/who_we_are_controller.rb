class WhoWeAreController < PagesController
  include ContentfulController
  
  def show; end
  
  def params
    super.merge(section_id: 'about-us', id: 'who-we-are')
  end
end
