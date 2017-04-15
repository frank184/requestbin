class Dashboard::BinsController < Dashboard::ApplicationController
  def create
    @bin = Bin.create
    redirect_to bin_requests_path(@bin.token), notice: "Bin was successfully created. Use the token <b>#{@bin.token}</b> to send requests"
  end
end
