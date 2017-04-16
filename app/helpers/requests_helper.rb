module RequestsHelper
  def show_request_link(request)
    link_to icon(:history, 'Show'), request, class: 'btn btn-xs btn-default'
  end

  def destroy_request_link(request)
    link_to icon(:trash, 'Delete'), request, class: 'btn btn-xs btn-default', method: :delete, data: { confirm: 'Are you sure?' }
  end

  def request_actions(request)
    %Q(#{show_request_link(request)} #{destroy_request_link(request)})
  end
end
