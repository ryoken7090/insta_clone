Rails.application.routes.draw do
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :index, :edit, :update]
  resources :stories do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy]
end
