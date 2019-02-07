class JsonWebToken
 class << self
   def encode(payload, exp = 24.hours.from_now)
     payload[:exp] = exp.to_i
     puts "payload:"
     p payload
     puts "secret_key_base"
     secret_key_base = Rails.application.credentials.secret_key_base
     JWT.encode(payload, secret_key_base)
   end

   def decode(token)
     body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
     HashWithIndifferentAccess.new body
   rescue
     nil
   end
 end
end