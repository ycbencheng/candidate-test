Rails.application.routes.draw do
  resources :articles
  devise_for :users
  # Custom route for creating a new user - admin only
  devise_scope :user do
  #   get "/create_new_user" => "users/registrations#new", as: "create_new_user" 
    post "/new_user" => "users/registrations#create"
  end

  resources :users, only: [:index, :edit, :update, :destroy]

  root to: "welcome#index"
end
