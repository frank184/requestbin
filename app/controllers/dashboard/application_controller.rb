class Dashboard::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'dashboard/application'
end
