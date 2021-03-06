class JsonWebToken
 class << self
   def encode(payload, exp = 24.hours.from_now)
     payload[:exp] = exp.to_i
     secret_key_base = Rails.application.credentials.secret_key_base
     JWT.encode(payload, secret_key_base)
   end

   def decode(token)
     body = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
     HashWithIndifferentAccess.new body
   rescue
     nil
   end
 end
end