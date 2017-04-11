Rails.application.routes.draw do
    constraints subdomain: /dashboard/ do
      scope module: :dashboard do
        devise_for :users,
                 path_names:  { sign_in: 'login', sign_out: 'logout', sign_up: 'sign-up' },
                 controllers: { sessions: 'dashboard/devise/sessions',
                                registrations: 'dashboard/devise/registrations',
                                passwords: 'dashboard/devise/passwords',
                                mailer: 'dashboard/devise/mailer'}
        resources :bins, path: '/', only: [:create] do
          resources :requests, path: '/', only: [:index, :show, :destroy]
        end
        scope :user do
          resources :requests, path: '/', only: [:index, :show, :destory]
        end
        root to: 'requests#index'
      end
    end

  root to: redirect('/requests', subdomain: 'dashboard', host: 'lvh.me') # for now
end
