Whiteboard::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  resources :users
  resources :messages
  resources :courses
  resources :sections
  resources :assignment_grades do
     collection do
      get 'alter' # /assignment_grades/alter
    end
  end
  resources :assignment_uploads do
    collection do
      get 'download' # /assignment_uploads/download?assignment=13&user=6&name=routes.rb
    end
  end
  resources :assignment_config_uploads do
    collection do
      get 'download' # /assignment_config_uploads/download?assignment=13&name=routes.rb
    end
  end
  resources :assignment_grades
  resources :assignments do
    member do
      get 'files' # /assignments/1/files
      get 'configs' # /assignments/1/configs
      get 'students' # /assignments/1/students
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
