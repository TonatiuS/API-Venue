class Ticket < ApplicationRecord
    belongs_to :event
    has_many :client_users, through: :history_tickets
    validates :event_id, :people, presence: true

    after_create :gen_folio

    def gen_folio
        folio_prefix = "VENUE"
        folio_num = id.to_s.rjust(6, '0')
        update!(folio: "#{folio_prefix}#{folio_num}")
      end
end
