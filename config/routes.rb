Rails.application.routes.draw do
  resources :articles
 
  #Custom route for creating a new user - admin only
  devise_scope :user do
    get "/create_new_user" => "users/registrations#new", as: "create_new_user" # custom path to sign_up/registration
  end
  # Below for all other routes:
  devise_for :users

  root to: "welcome#index"
end
