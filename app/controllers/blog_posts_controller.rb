class BlogPostsController < ApplicationController
  
  def index
    @blog_posts = BlogPost.all.load
  end
  
  def show
    @blog_post = BlogPost.find_by(slug: params[:id]).load.first
  end
  
end
