require 'rails_helper'
require 'features/steps/contentful_steps'

RSpec.describe ApplicationController, type: :controller, vcr: true, contentful: true do
  include ContentfulSteps

  describe '#index' do
    
    context 'with blog posts' do
      before { 4.times { |i| create_blog_post("Blog Post #{i}") } }
      
      it 'gets three blog posts' do
        get :index
        blog_posts = assigns(:blog_posts)
        expect(blog_posts.count).to eq(3)
      end
      
    end
    
  end

end
