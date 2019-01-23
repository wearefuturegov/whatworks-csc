require 'rails_helper'
require 'features/steps/contentful_steps'

RSpec.describe ResearchPartner, type: :model, vcr: true do
  include ContentfulSteps

  let(:person) { ResearchPartner.find(create_research_partner.id) }

  it 'has blog posts' do
    create_blog_post('some-blog-post', person)
    expect(person.blog_posts.count).to eq(1)
    expect(person.blog_posts.first).to be_a(BlogPost)
  end
end
