class LoginSerializer < ApplicationSerializer
  attributes  :email,
              :jti,
              :user_type,
              :name
end
  