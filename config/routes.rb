Whiteboard::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :assignment_types

  # TODO: Need whiteboard.com/user/assignments
  # Currently we have whiteboard.com/assignments
  # Need to get rid of whiteboard.com/uploads
  # Upload page should only exist at whiteboard.com/user/assignments/edit
  # See http://stackoverflow.com/questions/3589884/what-does-map-resource-in-the-route-file-do-exactly/3590622#3590622
  resources :assignments
  resources :uploads

  resources :sections

  resources :courses

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"

  devise_for :users
  resources :users
end