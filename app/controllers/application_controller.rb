# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, only: :expire_cache
  
  def index
    @blog_posts = BlogPost.all.order(:created_at).limit(3).load
  end
  
  def expire_cache
    ExpireCache.new(self).perform
  end
end
