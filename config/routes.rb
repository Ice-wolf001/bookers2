Rails.application.routes.draw do
  get 'sessions/new'
  devise_for :users
  resources :bookers, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update]
  get 'bookers2/edit'
  get 'home/about', to: "homes#about"
  root to: "homes#top"
  post 'books' => 'books#create' 
  get 'books' => 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
