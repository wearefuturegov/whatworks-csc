class ExpireCache
  def initialize(controller)
    @controller = controller
    @topic = controller.request.headers['X-Contentful-Topic']
    @params = controller.params
  end

  def perform
    return unless topic_applicable?
    @controller.send(:expire_action, controller: controller_name, action: 'index')
    @controller.send(:expire_action, controller: controller_name, action: 'show', id: slug)
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
