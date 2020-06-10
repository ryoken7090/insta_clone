Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :stories do
    collection do
      post :confirm
    end
  end
end
