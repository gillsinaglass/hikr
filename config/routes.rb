Rails.application.routes.draw do
  root "pages#home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :hikes, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :breaks, only: [:index, :show, :new, :create, :edit, :update]
  resources :trails, only: [:index, :show, :create, :new]
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :shelters, only: [:index, :show, :new, :create] 
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
