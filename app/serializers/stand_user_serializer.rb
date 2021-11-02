class StandUserSerializer < ApplicationSerializer
  attributes  :id,
              :contrato,
              :created_at,
              :updated_at
              
  has_one :user, serializer: UserSerializer
end
  