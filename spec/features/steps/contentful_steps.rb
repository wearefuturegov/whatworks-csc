module ContentfulSteps
  
  def create_contributor(slug = 'some-contributor', name = 'Some Name')
    contributor = Contributor.create(name: name, slug: slug)
    contributor.save && contributor.publish
    Contributor.find(contributor.id)
  end
  
  def create_team_member
    member = TeamMember.create(name: 'Person', slug: 'person')
    member.save && member.publish
    TeamMember.find(member.id)
  end
  
  def create_board_member
    member = BoardMember.create(name: 'Person', slug: 'person')
    member.save && member.publish
    BoardMember.find(member.id)
  end
  
  def create_stakeholder_panel
    panel = StakeholderPanel.create(name: 'Stakeholder Panel', content: 'Blah')
    panel.save && panel.publish
    StakeholderPanel.find(panel.id)
  end
  
  def create_blog_post(slug, author = create_team_member)
    post = BlogPost.create(title: slug, subheading: 'subheading', date: Date.today, slug: slug, body: 'Some Text', author: author)
    post.save && post.publish
    BlogPost.find(post.id)
  end
  
  def create_section(slug = 'some-section', title = 'Some Section')
    section = Section.create(title: title, slug: slug, content: 'Blah')
    section.save && section.publish
    Section.find(section.id)
  end
  
  def create_page(slug)
    page = Page.create(title: slug, slug: slug, section: create_section, content: 'Foo')
    page.save && page.publish
    Page.find(page.id)
  end
  
  step 'there is a blog post with the title :title' do |title|
    create_blog_post(title)
  end
  
  step 'there is a page called :title' do |title|
    @page = create_page(title)
  end
  
end

RSpec.configure do |config|
  config.include ContentfulSteps
end
