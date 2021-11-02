class EventSerializer < ApplicationSerializer
    attributes  :id,
                :name,
                :limit,
                :description,
                :date_venue,
                :venue_type,
                :active,
                :created_at,
                :updated_at

    belongs_to :place, serializer: PlaceSerializer
  end
  