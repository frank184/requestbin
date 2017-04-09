Rails.application.routes.draw do
  devise_for :users
  resources :requests, only: [:index, :show, :destory]
  root 'requests#index'
end
