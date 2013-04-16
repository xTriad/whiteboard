Whiteboard::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  resources :users

  resources :courses
  resources :sections
  resources :uploads
  resources :assignments do
    member do
      get  'files' # /assignments/1/files
    end
  end

  resources :assignment_grades
  resources :attendances do
    collection do
      get 'sendjson' # /attendances/sendjson
    end
  end

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => 'home#index'

end