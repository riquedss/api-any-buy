# frozen_string_literal: true

module JsonWebToken
  class Base
    SECRET = ENV.fetch('JWT_KEY', nil)
    def self.encode(id)
      JWT.encode(id, SECRET)
    end

    def self.decode(token)
      JWT.decode(token, SECRET)
    rescue StandardError
      nil
    end
  end
end
