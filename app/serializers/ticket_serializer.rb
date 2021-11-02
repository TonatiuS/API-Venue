class TicketSerializer < ApplicationSerializer
    attributes  :id,
                :folio,
                :logo,
                :people,
                :total,
                :event,
                :updated_at,
                :created_at
    has_many :events, serializer: EventSerializer
end
  