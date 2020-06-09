Rails.application.routes.draw do
  resources :stories do
    collection do
      post :confirm
    end
  end
end
