class Dashboard::RequestsController < Dashboard::ApplicationController
  before_action :authenticate_user!, unless: :bin?
  before_action :set_bin, if: :bin?
  before_action :set_request, only: [:show, :destroy]
  before_action :set_requests, only: [:index]

  # GET /requests
  # GET /requests.json
  def index
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
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
      @request = if user_signed_in?
        current_user.requests.find(params[:id])
      else
        @bin.requests.find(params[:id])
      end
    end

    def set_requests
      @requests = if user_signed_in?
        current_user.requests
      else
        @bin.requests
      end
    end

    def set_bin
      @bin = Bin.find_by_token(params[:bin_token])
    end

    def bin?
      params[:bin_token].present?
    end
end
