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

  # put 'attendances/:id/:atten' => "attendances#update_attendance"
  resources :attendances
  resources :grades
  resources :assignment_grades

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => 'home#index'

end