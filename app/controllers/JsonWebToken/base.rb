module JsonWebToken
    class Base
        SECRET = SecureRandom.base58(64)
        def self.encode(id)
            JWT.encode(id, SECRET)
        end

        def self.decode(token)
            begin
                JWT.decode(token, SECRET)
            rescue => exception
                return nil
            end
        end
    end
end