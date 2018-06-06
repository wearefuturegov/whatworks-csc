class PeopleController < ApplicationController
  caches_action :show, skip_digest: true, unless: :preview_enabled?
  
  def show
    @person = load_content(Person, params[:id])
  end
end
