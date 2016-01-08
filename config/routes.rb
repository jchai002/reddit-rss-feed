Rails.application.routes.draw do
  root 'feeds#index'
  resources :feeds

  resources :favorites, only: [:index, :create, :destroy]
end
