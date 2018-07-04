class BlogPostDecorator < Draper::Decorator
  delegate_all

  def decorate_title
    h.content_tag :h1, object.title
  end

  def decorate_subheading
    return nil unless defined?(object.subheading)
    h.content_tag :div, '', class: 'blog_sub_heading' do
      h.content_tag :h4, h.raw(object.subheading), class: 'subheading'
    end
  end

  def decorate_date
    date = object.try(:date) || object.created_at
    h.content_tag :p, date.strftime('%e %B %Y'), class: 'date'
  end

  def decorate_author(type = :short)
    return nil unless defined?(object.author)
    name = (type == :short ? object.author.name : author_name)
    h.content_tag :p, '', class: 'author' do
      h.link_to(name, object.author.path).to_s.html_safe
    end
  end

  def author_name
    if defined?(object.author.role) && object.author.role.present?
      "#{object.author.name}, #{object.author.role}"
    else
      object.author.name
    end
  end

  def decorate_body
    h.parse_markdown(object.body)
  end
end
