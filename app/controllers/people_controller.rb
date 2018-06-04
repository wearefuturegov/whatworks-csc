class PeopleController < ApplicationController
  caches_action :show, skip_digest: true
  
  def show
    @person = Person.find_by(slug: params[:id]).load.first
  end
end
