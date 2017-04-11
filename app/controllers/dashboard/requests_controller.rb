class Dashboard::RequestsController < Dashboard::ApplicationController
  before_action :authenticate_user!, unless: 'params[:bin_id].present?'
  before_action :set_request, only: [:show, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # POST /requests
  # POST /requests.json
  def create
    byebug
    req = Request.new(request)
    redirect_to requests_url, notice: 'Request was successfully created.'
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    redirect_to requests_url, notice: 'Request was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      if user_signed_in?
        @request = Request.find(params[:id])
      else
        @bin = Bin.find(params[:id])
      end
    end
end
