require 'rails_helper'

RSpec.describe BlogPost, type: :model, vcr: true do
  let(:blog_post) { BlogPost.all.load.first }
  
  it 'has an author' do
    expect(blog_post.author).to be_a(Person)
  end
end
