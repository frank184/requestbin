module AuthenticateRequest
  extend ActiveSupport::Concern

  included do
    helpers do
      def current_user
        return nil if request.headers['Authorization'].blank?
        @current_user ||= User.find_by_token(request.headers['Authorization'])
      end

      def authenticate!
        raise error!({meta: {code: RESPONSE_CODE[:unauthorized], message: I18n.t("errors.not_authenticated"), debug_info: ''}}, RESPONSE_CODE[:unauthorized]) unless current_user
      end

      def authenticate_request!
        if request.headers['AccessToken'].blank?
          raise error!({meta: {code: RESPONSE_CODE[:forbidden], message: I18n.t("errors.bad_request"), debug_info: ''}}, RESPONSE_CODE[:forbidden])
        end
      end

    end
  end

end
