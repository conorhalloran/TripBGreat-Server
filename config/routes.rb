Rails.application.routes.draw do

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :trips, only: [:create, :update, :index, :show, :destroy] do
      resources :days, shallow: true, only: [:create, :index, :show, :destroy, :update]
    end
    resources :users, only: [:create, :index, :show] do
      resources :friendships, shallow: true, only: [:create, :index, :destroy]
    end
    resources :sessions, only: [:new, :create] do
      delete :destroy, on: :collection
    end
    resources :tokens, only: [:create]
    
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  

  root "trips#index"
end
