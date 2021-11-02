class ClientUserSerializer < ApplicationSerializer
  attributes  :id,
              :card,
              :date_card,
              :created_at,
              :updated_at
              
  belongs_to :user, serializer: UserSerializer
end
  