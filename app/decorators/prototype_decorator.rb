class PrototypeDecorator < ApplicationDecorator
  delegate_all
  
  def decorate_title
    h.content_tag(:h1, object.title)
  end
  
  def decorate_what_we_want_to_achieve
    body_with_subheading(:what_we_want_to_achieve, 'What we want to achieve')
  end
  
  def decorate_who_we_are_working_with
    body_with_subheading(:who_we_are_working_with, 'Who we are working with')
  end
  
  def decorate_what_stage_are_we_at_now
    body_with_subheading(:what_stage_are_we_at_now, 'What stage we are at now')
  end
  
  def decorate_what_are_the_next_steps
    body_with_subheading(:what_stage_are_we_at_now, 'What are the next steps')
  end
end
