class PagesController < ApplicationController
  include ContentfulController

  def show; end
  
  private
  
  def load_content
    check_preview
    params[:page_id] ? load_subpage : load_page
  end
  
  def load_subpage
    @parent_page = Page.load_children(10).find_by(slug: params[:page_id]).load.first
    content = @parent_page.sub_pages.find { |p| p.slug == params[:id] }
    @page = content.decorate
  end
  
  def load_page
    content = Page.load_children(10).find_by(slug: params[:id]).load.first
    @page = content.decorate
  end
end
