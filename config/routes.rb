Rails.application.routes.draw do
  resources :users,        only: :create
  resources :relatives,    only: [:create, :index]
  resources :knock_knocks, only: :create
end
