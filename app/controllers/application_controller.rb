# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper ContentfulRails::MarkdownHelper

  skip_before_action :verify_authenticity_token, only: :expire_cache

  def expire_cache
    return unless request.headers['X-Contentful-Topic'] == 'ContentManagement.Entry.publish'
    content_type = params[:sys][:contentType][:sys][:id]
    controller = content_type.underscore.pluralize
    slug = params[:fields][:slug].values.first
    expire_action controller: controller, action: 'index'
    expire_action controller: controller, action: 'show', id: slug
  end
end
