class V1::Requests < Grape::API
  include V1Base
  include AuthenticateRequest

  get '/' do
    { request: Request.new }
  end

  post '/' do
    req = Request.new(headers: headers.to_json, params: params.to_json, owner: current_user)

    if req.save
      req
    else
      req.errors
    end
  end

  params do
    requires :token, type: String, desc: 'Bin token'
  end
  post '/:token' do
    bin = Bin.find_by_token(params[:token])
    req = Request.new(headers: headers.to_json, params: params.except(:token).to_json, owner: bin)

    if req.save
      req
    else
      req.errors
    end
  end
end
