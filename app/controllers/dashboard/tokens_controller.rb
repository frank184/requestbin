class Dashboard::TokensController < Dashboard::ApplicationController
  before_action :authenticate_user!, unless: 'params[:bin_uuid].present?'
  before_action :set_request, only: [:show, :destroy]

  # GET /tokens
  def index
  end

  # PUT /tokens
  def update
    
  end
end
