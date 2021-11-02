class SignUpSerializer < ApplicationSerializer
  attributes  :id,
              :email,
              :jti,
              :user_type,
              :name,
              :created_at,
              :updated_at
              
end
  