class Ticket < ApplicationRecord
    belongs_to :event
    belongs_to :ticket_type
    belongs_to :cupon
    has_many :client_users, through: :history_tickets
    validates :event_id, :people, :ticket_type_id, presence: true

    after_create :gen_folio
    after_create :update_totals

    def gen_folio
        folio_prefix = "VENUE"
        folio_num = id.to_s.rjust(6, '0')
        update!(folio: "#{folio_prefix}#{folio_num}")
    end

    def update_totals
        totals_method
        save
    end


    private
    #Logica de precios
    def totals_method
        cost = self.ticket_type.cost
        total = (self.people.to_i * cost) 
        total = total - (self.cupon.average / 100).percent_of(total)  if self.cupon.cupon_valid? #metodo sacar porcentaje 
        update!(total: total)
    end
   
end
