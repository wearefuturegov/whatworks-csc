class PersonDecorator < ApplicationDecorator
  delegate_all
  
  def decorate_image
    return unless defined?(object.photo)
    h.image_tag object.photo.resize(200, 200).thumbnail_focused_on('face').load
  end
  
  def decorate_name
    h.content_tag('h1', object.name)
  end
  
  def decorate_role
    h.content_tag('h4', object.role) if defined?(object.role)
  end
  
  def decorate_bio
    if defined?(object.bio)
      h.parse_markdown(object.bio)
    else
      h.content_tag('p', '') do
        h.content_tag('i', 'Biography coming soon')
      end
    end
  end
end
