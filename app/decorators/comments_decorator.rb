class CommentsDecorator < ApplicationDecorator
  delegate_all
  
  def decorate_name
    standard_wrapper('Name', object.name)
  end
  
  def decorate_organisation
    standard_wrapper('Organisation', object.organisation)
  end
  
  def decorate_comments
    h.content_tag(:div, '', class: 'comment') do
      h.content_tag(:blockquote, h.parse_markdown(object.comment))
    end
  end
  
end
