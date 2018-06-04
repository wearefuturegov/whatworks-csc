# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :blog_posts, path: 'blog', only: %i[index show]

  post :expire_cache, to: 'application#expire_cache'
end
