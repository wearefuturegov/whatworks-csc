require 'rails_helper'
require 'features/steps/contentful_steps'

RSpec.describe BlogPostsController, type: :controller, vcr: true do
  include ContentfulSteps
  
  before do
    create_section('whats-new', "What's new")
    2.times { |i| create_blog_post("blog-post-#{i}") }
  end
  
  describe '#show' do
    let(:subject) { get :show, params: { id: 'blog-post-1' } }
    
    it 'gets a blog post and section' do
      subject
      expect(assigns(:blog_post)).to be_a(BlogPost)
      expect(assigns(:blog_post).title).to eq('blog-post-1')
      expect(assigns(:section)).to be_a(Section)
      expect(assigns(:section).title).to eq("What's new")
    end
  end
  
  describe '#index' do
    let(:subject) { get :index }

    it 'gets the posts and section' do
      subject
      expect(assigns(:blog_posts).count).to be > 0
      expect(assigns(:section)).to be_a(Section)
      expect(assigns(:section).title).to eq("What's new")
    end
  end
  
end
