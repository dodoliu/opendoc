Rails.application.routes.draw do
  root 'home#index'
  get  'home/interface_info'=> 'home#interface_info'

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
  end
end
