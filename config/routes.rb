Whiteboard::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config # TODO: Why is this in here twice?

  # TODO: Need to get rid of whiteboard.com/uploads
  # Upload page should only exist at whiteboard.com/courses/id/sections/id/assignments/id/edit
  # See http://stackoverflow.com/questions/3589884/what-does-map-resource-in-the-route-file-do-exactly/3590622#3590622
  # and http://guides.rubyonrails.org/routing.html @ 2.7.1 Limits to Nesting

  # whiteboard.com/courses/id/sections/id/assignments/id
  resources :courses do
    resources :sections do
      resources :assignments
    end
  end

  resources :assignment_types
  # resources :courses
  # resources :sections
  # resources :assignments
  resources :uploads

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"

  devise_for :users
  resources :users
end