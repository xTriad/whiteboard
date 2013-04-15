Whiteboard::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
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

# See http://guides.rubyonrails.org/routing.html
#       2.7.1 Limits to Nesting
#       2.5 Singular Resources (make profile go to currently logged in user's profile)
#            match "profile" => "users#show"
#       3.2 Dynamic Segments
#            match ':controller/:action/:id/:user_id'

# TODO: **** 2.9 Adding More RESTful Actions *****
# http://stackoverflow.com/questions/3589884/what-does-map-resource-in-the-route-file-do-exactly/3590622#3590622
