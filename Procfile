web: bundle exec puma config.ru ${APP_PORT:-5000} -e ${RACK_ENV:-development}
actioncable: bundle exec puma cable/config.ru -p ${WS_PORT:-28080} -e ${RACK_ENV:-development}
worker: bundle exec sidekiq
