Rails.application.routes.draw do
  resources :contacts
  mount LetterOpenerWeb::Engine, at: "/letter_wei" if Rails.env.development?
  root 'users#new'
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :users
  resources :sessions, only: %i[new create destroy]
  resources :favorites, only: %i[create destroy]
  get '/favorite_pictures', to: 'pictures#picture_favorites'
end
