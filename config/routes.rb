Rails.application.routes.draw do
  resources :users,       only: :create
  resources :relatives,   only: :create
  resource  :knock_knock, only: :create
end
