# frozen_string_literal: true

class BlogPostsController < ApplicationController
  include ContentfulController

  def index
    @section = Section.find_by(slug: 'whats-new').load.first
  end

  def show; end
end
