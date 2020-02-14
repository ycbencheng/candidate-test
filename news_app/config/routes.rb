Rails.application.routes.draw do
  # get 'articles/index'
  # get 'articles/show'
  # get 'articles/new'
  # get 'articles/edit'
  resources :articles

  devise_for :users
  root 'welcome#index'
end
