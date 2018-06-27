class ExpireCache
  def initialize(controller)
    @controller = controller
    @topic = controller.request.headers['X-Contentful-Topic']
    @params = controller.params
  end

  def perform
    return unless topic_applicable?
    clear_index_cache
    clear_content_cache(slug)
  end
  
  def clear_content_cache(slug)
    clear_cache(controller: controller_name, action: 'show', id: slug)
  end
  
  def clear_index_cache
    clear_cache(controller: controller_name, action: 'index')
  end
  
  def clear_cache(*path_options)
    @controller.send(:expire_action, *path_options)
  rescue ActionController::UrlGenerationError
    nil
  end

  def controller_name
    content_type = @params[:sys][:contentType][:sys][:id]
    content_type.underscore.pluralize
  end

  def slug
    @params[:fields][:slug].values.first
  end

  def topic_applicable?
    topics.include?(@topic)
  end

  def topics
    [
      'ContentManagement.Entry.publish',
      'ContentManagement.Entry.unpublish',
      'ContentManagement.Entry.delete'
    ]
  end
end
