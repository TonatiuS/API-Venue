class TicketSerializer < ApplicationSerializer
    attributes  :id,
                :folio,
                :logo,
                :people,
                :total,
                :updated_at,
                :created_at

    belongs_to :event, serializer: EventSerializer
end
  