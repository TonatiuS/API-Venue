class PlaceSerializer < ApplicationSerializer
  attributes  :id,
              :adress,
              :name,
              :state,
              :created_at,
              :updated_at

  def state
    object.state
  end
end
  