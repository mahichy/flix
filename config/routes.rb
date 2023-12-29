Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'movies#index'

  # get 'movies' => "movies#index"
  # get 'movies/new' => 'movies#new'
  # get 'movies/:id' => "movies#show", as: 'movie'
  # get 'movies/:id/edit' => 'movies#edit', as: "edit_movie"
  # patch 'movies/:id' => 'movies#update'

  resources :movies do
  resources :reviews
  end

  resource :session, only: [:new, :create, :destroy]
  get 'signin' => "sessions#new"

  resources :users
  get 'signup' => "users#new"
end
