class TicketTypeSerializer < ApplicationSerializer
    attributes  :id,
                :type,
                :total_limit,
                :total_leftover,
                :active,
                :cost,
                :updated_at,
                :created_at
    belongs_to :event, serializer: EventSerializer
end
  