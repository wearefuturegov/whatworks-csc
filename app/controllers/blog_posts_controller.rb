# frozen_string_literal: true

class BlogPostsController < ApplicationController
  caches_action :index, :show, skip_digest: true, unless: :preview_enabled?
  include ContentfulController

  def index
    @blog_posts = BlogPost.all.load
  end

  def show; end
  
end
