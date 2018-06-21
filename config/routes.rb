Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :brews, only: [:show, :index]
  resources :customers, only: [:show, :index]
  resources :purchases, only: [:new, :create]
end
