class Dashboard::BinsController < Dashboard::ApplicationController
  def create
    @bin = Bin.create
    redirect_to bin_requests_path(bin_id: @bin.uid)
  end
end