Rails.application.routes.draw do
  constraints subdomain: /dashboard/ do
    scope module: :dashboard do
      devise_for :users,
               path_names:  { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' },
               controllers: { sessions: 'dashboard/devise/sessions',
                              registrations: 'dashboard/devise/registrations',
                              passwords: 'dashboard/devise/passwords',
                              mailer: 'dashboard/devise/mailer'}
      devise_scope :user do
        authenticated do
          resources :requests, only: [:index, :show, :destory]
          resources :tokens, only: :index do
            collection do
              put   '/', to: 'dashboard/tokens#update'
              patch '/', to: 'dashboard/tokens#update'
            end
          end
          root to: 'requests#index'
        end
        unauthenticated do
          resources :bins, only: [:create], param: :uuid do
            resources :requests, path: '/', only: [:index, :show, :destroy]
          end
        end
      end

      root to: 'devise/sessions#new'
    end
  end

  # root to: redirect('/', subdomain: :dashboard, host: 'lvh.me')
end
