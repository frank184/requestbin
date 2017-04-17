module V1Base
  extend ActiveSupport::Concern

  HEADERS_DOCS = {
    Authorization: {
      description: "User Authorization Token",
      required: true
    }
  }

  included do
    format :json
    default_format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    version 'v1', using: :path

    rescue_from ActiveRecord::RecordNotFound do |e|
      render_error(RESPONSE_CODE[:not_found], I18n.t("errors.#{e.model.to_s.downcase}.not_found"))
    end

    rescue_from Exception do |e|
      puts "#{e.class}: #{e.message}\n#{e.backtrace}"
      render_error(e.http_status, e.error.message, e.error.debug_info)
    end

    helpers do
      def logger
        Rails.logger
      end
    end
  end

end
