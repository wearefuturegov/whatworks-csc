class PersonDecorator < ApplicationDecorator
  delegate_all
  
  def decorate_image
    return unless defined?(object.photo)
    h.image_tag object.photo.resize(200, 200).thumbnail_focused_on('face').load
  end
end
