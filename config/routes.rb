Whiteboard::Application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # See http://guides.rubyonrails.org/routing.html
  #       2.7.1 Limits to Nesting
  #       2.5 Singular Resources (make profile go to currently logged in user's profile)
  #            match "profile" => "users#show"
  #       3.2 Dynamic Segments
  #            match ':controller/:action/:id/:user_id'

  # TODO: **** 2.9 Adding More RESTful Actions *****
  # http://stackoverflow.com/questions/3589884/what-does-map-resource-in-the-route-file-do-exactly/3590622#3590622

  resources :courses
  resources :sections
  resources :assignments
  resources :uploads
  resources :assignment_types
  put 'attendances/:id/:atten' => "attendances#updateAtten"
  resources :attendances

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => 'home#index'

  devise_for :users
  resources :users
  resources :grades
  resources :teachergrades
end
