class Dashboard::TokensController < Dashboard::ApplicationController
  before_action :authenticate_user!

  # GET /tokens
  def index
  end

  # PUT /tokens
  def update
    current_user.regenerate_token
    redirect_to tokens_path
  end
end
