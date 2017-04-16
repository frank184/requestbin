class Dashboard::RequestsDatatable < Dashboard::ApplicationDatatable

  def sortable_columns
    @sortable_columns ||= %w(Request.headers Request.params)
  end

  def searchable_columns
    @searchable_columns ||= %w(Request.headers Request.params)
  end

  private

  def data
    records.map do |request|
      [
        view.content_for_hash(request.headers),
        view.content_for_hash(request.params),
        view.request_actions(request)
      ]
    end
  end
end
