# frozen_string_literal: true

class BlogPostsController < ApplicationController
  include ContentfulController
  
  append_before_action :fetch_section

  def index; end

  def show; end
  
  private
  
  def fetch_section
    @section = Section.find_by(slug: 'whats-new').load.first
  end
end
