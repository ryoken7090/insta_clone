Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    collection do
      get :favorites_index
    end
  end
  resources :stories do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy]
end
