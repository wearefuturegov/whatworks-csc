class PagesController < ApplicationController
  include ContentfulController

  def show; end
  
  private
  
  def load_content
    check_preview
    @section = Section.load_children(10).find_by(slug: params[:section_id]).load.first
    content = @section.pages.find { |p| p.slug == params[:id] }
    @page = content.decorate
  end
end
