require 'api_constraints'

Rails.application.routes.draw do
  devise_for :customers

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
      resources :tourisms, only: [:index, :show]
      resources :newses, only: [:index, :show]
      resources :jobs, only: [:index, :show]
      resources :activities, only: [:index, :show]
      resources :advertisements, only: [:index]
      resources :virtual_tourisms, only: [:index, :show]
      resources :addresses, only: [:index, :create]
      resources :orders
      resource :consumer, only: [:show, :update]
      resources :transactions
      get  'search/:key_word', to: 'products#search'
      post 'oauth_sign_in', to: 'wechats#sign_in'
    end
  end
end
