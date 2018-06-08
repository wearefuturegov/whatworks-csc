class JobsController < ApplicationController
  include ContentfulController
  index_query -> { { 'fields.closingDate[gte]' => Date.today } }

  def show; end
  
  def index; end
end
