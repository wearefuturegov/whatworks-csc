class BlogPostDecorator < Draper::Decorator
  delegate_all

  def decorate_title
    h.content_tag :h1, object.title
  end
  
  def decorate_image
    return unless defined?(object.image)
    h.image_tag object.image.resize(200, 200).thumbnail_focused_on('face').load
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
    h.content_tag :p, '', class: 'author' do
      if defined?(object.author)
        link_to_author(type)
      else
        h.link_to('Press Release', h.section_page_path(section_id: 'whats-new', id: 'press'))
      end.to_s.html_safe
    end
  end
  
  def link_to_author(type)
    name = (type == :short ? object.author.name : author_name)
    h.link_to(name, object.author.path)
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
  
  def type_tag
    type = defined?(object.author) ? 'Blog Post' : 'News'
    h.content_tag(:span, type, class: 'type_tag')
  end
end
