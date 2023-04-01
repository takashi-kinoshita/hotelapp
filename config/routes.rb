Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  
  resource :account, controller: 'account', only: [:show, :edit, :update] 
  resource :profile, only: [:edit, :update]

  resources :users, only: [:index] 
  root to: "home#index"
  
  resources :rooms, only: [:index, :show, :new, :create] do
    collection do
      get :search
    end
    resources :reservations, only: [:new, :create, :index]
  end

  resources :reservations, only: [:index, :show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
