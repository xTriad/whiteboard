Whiteboard::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  resources :users
  resources :messages
  resources :courses
  resources :sections
  resources :uploads
  resources :assignment_grades do
     collection do
      get 'alter' # /assignment_grades/alter
    end
  end
  resources :assignments do
    member do
      get  'files' # /assignments/1/files
    end
  end

  resources :attendances do
    collection do
      get 'alter' # /attendances/alter
    end
  end

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => 'home#index'

end
