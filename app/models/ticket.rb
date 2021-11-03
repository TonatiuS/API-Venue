class Ticket < ApplicationRecord
    belongs_to :event
    belongs_to :ticket_type
    belongs_to :cupon
    has_many :client_users, through: :history_tickets
    validates :event_id, :people, :ticket_type_id, presence: true
    validate :exist_quota?
    after_create :gen_folio, :update_totals, :sell_ticket

    def gen_folio
        folio_prefix = "VENUE"
        folio_num = id.to_s.rjust(6, '0')
        update!(folio: "#{folio_prefix}#{folio_num}")
    end

    def update_totals
        totals_method
        save
    end

    def exist_quota?
        #check ticket_type has availability
        unless ticket_type.exist_quota?(self.people.to_i)
            errors.add(:people, "the amount of space is greater than available")
        end
    end

    def sell_ticket
        #Subtract the number of spaces sold from the ticket_type
        self.ticket_type.sell_ticket(self.people.to_i)
    end

    private
    #Logic price
    def totals_method
        cost = self.ticket_type.cost
        total = (self.people.to_i * cost) 
        total = total - total * (self.cupon.average / 100)  if self.cupon.cupon_valid? #metodo sacar porcentaje 
        update!(total: total)
    end
   
end
