ActiveRecord::Base.logger = Logger.new(STDOUT)
User.create_with(password: Rails.application.secrets.admin_password)
    .find_or_create_by(email: Rails.application.secrets.admin_email)
