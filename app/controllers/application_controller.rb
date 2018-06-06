# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper ContentfulRails::MarkdownHelper
  helper_method :load_content
  
  skip_before_action :verify_authenticity_token, only: :expire_cache

  def expire_cache
    ExpireCache.new(self).perform
  end
  
  private
  
  def preview_enabled?
    params[:preview_token] == ENV['PREVIEW_TOKEN']
  end
  
  def check_preview
    ContentfulModel.use_preview_api = preview_enabled?
  end
  
  def load_content(klass, slug)
    check_preview
    klass.find_by(slug: slug).load.first
  end
end
