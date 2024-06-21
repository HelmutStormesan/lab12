Rails.application.routes.draw do
  get 'profile', to: 'profiles#show', as: 'profile'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  resources :posts do
    resources :comments, only: [:new, :create]
  end
  resources :comments
end
