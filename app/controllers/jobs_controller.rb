class JobsController < ApplicationController
  include ContentfulController
  index_query -> { { 'fields.closing_date[gte]' => Date.today } }

  def show; end
  
  def index; end
end
