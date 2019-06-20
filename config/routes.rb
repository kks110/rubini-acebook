Rails.application.routes.draw do
  get 'welcome/index'

  resources :posts

  get 'signup' => 'users#new'
  resources :users
  get 'login' => 'sessions#new'
  resources :sessions
  post 'login' => 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
