Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index, :edit, :update]
  resources :stories do
    collection do
      post :confirm
    end
  end
end
