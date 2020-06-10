Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index]
  resources :stories do
    collection do
      post :confirm
    end
  end
end
