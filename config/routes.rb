Rails.application.routes.draw do
    constraints subdomain: /dashboard/ do
      devise_for :users
      scope module: :dashboard do
        resources :requests, only: [:index, :show, :destory]
        root to: 'requests#index'
      end
    end

  root to: redirect('/requests', subdomain: 'dashboard') # for now
end
