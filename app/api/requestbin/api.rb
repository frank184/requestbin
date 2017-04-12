class Requestbin::API < Grape::API
  mount Requestbin::API::V1 => '/v1'
  format :json
  get '/' do
    {ping: 'pong'}
  end
end
