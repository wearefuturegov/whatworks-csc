require 'rails_helper'

RSpec.describe BlogPostsController, type: :controller, vcr: true do
    
  describe '#show' do
    it_behaves_like 'contenful controller #show', 'blog_post', BlogPost, 'some-blog-post'
  end
  
  describe '#index' do
    it_behaves_like 'contenful controller #index', 'blog_post', BlogPost
  end
  
end
