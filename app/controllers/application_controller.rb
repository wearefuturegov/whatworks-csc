# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, only: :expire_cache
  
  rescue_from ActionController::RoutingError, with: -> { render_404 } unless Rails.application.config.consider_all_requests_local
  
  def index
    @blog_posts = BlogPost.all.order(date: :desc).limit(3).load
  end
  
  def expire_cache
    ExpireCache.new(self).perform
  end
  
  def render_404
    respond_to do |format|
      format.html { render template: 'errors/not_found', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end
end
