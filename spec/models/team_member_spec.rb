require 'rails_helper'

RSpec.describe TeamMember, type: :model, vcr: true do
  let(:person) { TeamMember.all.load.first }

  it 'has blog posts' do
    expect(person.blog_posts.count).to eq(2)
    expect(person.blog_posts.first).to be_a(BlogPost)
  end
end
