Rails.application.routes.draw do

  devise_for :users
  root "posts#index"
  resources :posts do
    resources :comments, only:[:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  resources :contacts, only: [:create]
  get 'about', to: 'pages#about', as: 'about'
  get 'contact', to: 'pages#contact', as: 'contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
