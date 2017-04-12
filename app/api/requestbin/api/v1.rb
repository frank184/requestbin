class Requestbin::API::V1 < Grape::API
  mount Requestbin::API::V1::Requests
end
