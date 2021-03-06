Rails.application.routes.draw do
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users  

  root 'home#index'
  get 'home/interfaces' => 'home#interfaces'
  get 'home/interface_info' => 'home#interface_info'

  # require 'sidekiq/web'
  # mount sidekiq::web => '/sidekiq'

  namespace :backend do
    root 'groups#index'
    resources :groups do
      resources :interfaces
    end
    resources :interfaces do
      resources :interface_params, :interface_responses
    end
    resources :members do
      put :add_group_member
    end
    resources :groups_members, only: [:index, :create, :destroy]
    resources :users
    resources :roles
    resources :users_roles, only: [:create]

    require 'sidekiq/web'
    mount Sidekiq::Web => 'sidekiq'

  end
end
