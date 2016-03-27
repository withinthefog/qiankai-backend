require 'api_constraints'

Rails.application.routes.draw do
  devise_for :customers
  namespace :api do
  namespace :v1 do
    get 'address/index'
    end
  end

  devise_for :consumers, controllers: {registrations: "registrations", sessions: "sessions"}
  mount Rich::Engine => '/rich', :as => 'rich'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'


  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root :to => "admin/dashboard#index"

  namespace :api, constraints: {id: /[^\/]+/} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :articles, only: [:index, :show]
      resources :products, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :newses, only: [:index, :show]
      resources :jobs, only: [:index, :show]
      resources :activities, only: [:index, :show]
      resources :advertisements, only: [:index]
      resources :addresses, only: [:index, :create]
      get  'search/:key_word', :to => 'articles#search'
    end
  end
end
