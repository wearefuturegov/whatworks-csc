class SectionsController < ApplicationController
  include ContentfulController
  
  append_before_action :load_pages

  def show; end
  
  private
  
  def load_pages
    @pages = @section.pages.sort_by(&:title)
  end
end
