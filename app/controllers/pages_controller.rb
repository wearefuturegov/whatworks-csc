class PagesController < ApplicationController
  include ContentfulController

  def show; end
  
  private
  
  def fetch_section
    @section = Section.load_children(10).find_by(slug: params[:section_id]).load.first
    raise(ActionController::RoutingError, 'Not Found') if @section.nil?
  end
  
  def load_content
    check_preview
    fetch_section
    content = @section.pages.find { |p| p.slug == params[:id] }
    raise(ActionController::RoutingError, 'Not Found') if content.nil?
    @page = content.decorate
  end
end
