Rails.application.routes.draw do
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  namespace :backend do
    root 'groups#index'
    resources :groups do
      resources :interfaces
    end
    resources :interfaces do
      resources :interface_params
      resources :interface_responses
    end
    resources :members
  end
end
