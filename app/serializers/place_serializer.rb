class PlaceSerializer < ApplicationSerializer
  attributes  :id,
              :adress,
              :name,
              :state
              :created_at,
              :updated_at
              
  has_one :user, serializer: UserSerializer

  def state
    object.state
  end
end
  