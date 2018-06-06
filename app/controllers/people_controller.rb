class PeopleController < ApplicationController
  caches_action :show, skip_digest: true, unless: :preview_enabled?
  include ContentfulController

  def show; end
end
