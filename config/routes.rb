Rails.application.routes.draw do
  root 'users#new'
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
