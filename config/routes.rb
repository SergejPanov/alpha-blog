Rails.application.routes.draw do
  root 'articles#index'
  resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
end
