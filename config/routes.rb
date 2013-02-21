Whiteboard::Application.routes.draw do
  resources :assignment_types


  resources :sections


  resources :courses


  resources :assignments


  authenticated :user do
    resources :uploads
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end