class ResearchReportDecorator < ApplicationDecorator
  delegate_all
  
  def decorate_title
    h.content_tag(:h1, object.title)
  end
  
  def decorate_summary
    body_with_subheading(:summary, 'Summary')
  end
  
  def decorate_objectives
    body_with_subheading(:objectives, 'Objectives')
  end
  
  def decorate_how_we_went_about_it
    body_with_subheading(:how_we_went_about_it, 'How we went about it')
  end
  
  def decorate_key_findings
    body_with_subheading(:key_findings, 'Key findings')
  end
  
  def decorate_what_next
    body_with_subheading(:what_next, 'What next')
  end
  
end
