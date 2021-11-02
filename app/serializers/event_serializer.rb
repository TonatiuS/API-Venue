class EventSerializer < ApplicationSerializer
    attributes  :id,
                :name,
                :limit,
                :description,
                :date_venue,
                :venue_type,
                :active,
                :updated_at,
                :created_at
                has_many :places, serializer: PlaceSerializer
  end
  