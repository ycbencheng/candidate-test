Rails.application.routes.draw do
  devise_for :editors, controllers: { sessions: "editor_sessions" }
  devise_for :admins, controllers: { sessions: "admin_sessions" }
  devise_for :users

  resources :users_admin, controller: :admins

  root to: 'pages#home'
  resources :articles, only: [:index, :new, :create, :show, :edit, :destroy, :update ]
end
