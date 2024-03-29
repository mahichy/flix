Rails.application.routes.draw do
  resources :genres
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'movies#index'

  get "movies/filter/:filter" => "movies#index", as: :filtered_movies 

  # get 'movies' => "movies#index"
  # get 'movies/new' => 'movies#new'
  # get 'movies/:id' => "movies#show", as: 'movie'
  # get 'movies/:id/edit' => 'movies#edit', as: "edit_movie"
  # patch 'movies/:id' => 'movies#update'

  resources :movies do
  resources :reviews
  resources :favorites, only: [:create, :destroy]
  end

  resource :session, only: [:new, :create, :destroy]
  get 'signin' => "sessions#new"

  resources :users
  get 'signup' => "users#new"
end
