Rails.application.routes.draw do
  resources :hikes, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :breaks, only: [:index, :show, :new, :create, :edit, :update]
  resources :shelters, only: [:index, :show]
  resources :trails, only: [:index, :show, :create, :new]
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
