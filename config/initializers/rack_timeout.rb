Rack::Timeout.service_timeout = Rails.env.development? ? 120 : 25  # seconds
