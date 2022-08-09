# frozen_string_literal: true

module JsonWebToken
  class Base
    SECRET = SecureRandom.base58(64)
    def self.encode(id)
      JWT.encode(id, SECRET)
    end

    def self.decode(token)
      JWT.decode(token, SECRET)
    rescue StandardError => exception
      nil
    end
  end
end
