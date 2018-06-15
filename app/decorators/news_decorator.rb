class NewsDecorator < Draper::Decorator
  delegate_all
  
  def decorate_title
    h.content_tag :h1, object.title
  end
  
  def decorate_subheading
    h.content_tag :p, h.raw(object.subheading), class: 'subheading'
  end
  
  def decorate_date
    date = object.try(:date) || object.created_at
    h.content_tag :p, date.strftime('%e %B %Y'), class: 'date'
  end
  
  def decorate_body
    h.parse_markdown(object.body)
  end
end
