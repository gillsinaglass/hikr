Rails.application.routes.draw do
  resources :hikes, only: [:index, :show, :new, :create, :destroy]
  resources :breaks, except: [:destroy, :index]
  resources :shelters, only: [:index, :show]
  resources :trails, only: [:index, :show]
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
