Rails.application.routes.draw do
  get 'users/new'
  resources :stories do
    collection do
      post :confirm
    end
  end
end
