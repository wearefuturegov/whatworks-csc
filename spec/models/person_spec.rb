require 'rails_helper'

RSpec.describe Person, type: :model, vcr: true do
  let(:person) { Person.all.load.first }
  
  it 'has blog posts' do
    expect(person.blog_posts.count).to eq(1)
    expect(person.blog_posts.first).to be_a(BlogPost)
  end
end
