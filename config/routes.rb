Rails.application.routes.draw do
  resources :posts do
    resources :likes
  end

  get 'signup' => 'users#new'
  resources :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'profile/:id' => 'posts#profile', as: :profile

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
end
