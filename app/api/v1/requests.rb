class V1::Requests < Grape::API
  include V1Base
  include AuthenticateRequest

  get '/' do
    {request: 'api'}
  end

  post '/' do
    req = Request.new(headers: headers.to_json, params: params.to_json, owner: current_user)

    if req.save
      {request: req}
    else
      {errors: req.errors}
    end
  end

  params do
    requires :token, type: String, desc: 'Bin token'
  end
  post '/:token' do
    token = params[:token]
    bin = Bin.find_by_token(token)
    req = Request.new(headers: headers, body: params, owner: bin)

    if req.save
      {request: req}
    else
      {errors: req.errors}
    end
  end
end
