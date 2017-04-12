require_relative '../config/environment'
Rails.application.eager_load!

run Requestbin::API
