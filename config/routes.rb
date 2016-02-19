require 'api_constraints'

Rails.application.routes.draw do
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
      resources :articles, only: [:index]
      resources :products, only: [:index, :show]
      resources :newses, only: [:index, :show]
    end
  end
end
