Rails.application.routes.draw do
  resources :users,        only: :create, defaults: { format: 'json' }
  resources :relatives,    only: [:create, :index], defaults: { format: 'json' }
  resources :knock_knocks, only: :create, defaults: { format: 'json' }
end
