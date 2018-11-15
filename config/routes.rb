# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#index'
  
  get 'whats-new', to: 'blog_posts#index'
  
  resources :blog_posts, path: '/whats-new/blog', only: %i[index show] do
    resources :comments, only: %i[create]
  end
  resources :team_members, path: 'team', only: %i[show]
  resources :board_members, path: 'board', only: %i[show]
  resources :contributors, only: %i[show]
  resources :news, only: %i[index show]
  resources :research_reports, only: %i[show] do
    resources :sub_reports, only: %i[show], controller: 'sub_research_reports'
  end
  resources :prototypes, only: %i[show]

  get 'contact-us', to: 'contact_forms#new', as: :new_contact_forms
  post 'contact-us', to: 'contact_forms#create', as: :contact_forms
  
  get 'comments/:id/publish', to: 'comments#publish'
  
  post :expire_cache, to: 'application#expire_cache'
  
  get 'about-us/who-we-are', to: 'who_we_are#show'
  
  resources :sections, path: '/', only: :show do
    resources :pages, path: '/', only: :show
  end
end
