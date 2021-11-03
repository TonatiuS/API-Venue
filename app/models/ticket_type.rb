class TicketType < ApplicationRecord
    belongs_to :event
    has_many :tickets
    
    enum type: {vip: 0, plus: 1, standar: 2  }
    # validate :exist_quota_on_event, on: :create
    validate :exist_quota_on_event

    def quota(amount)
        #verify that there is space on the ticket
        update(total_leftover: self.total_leftover-amount)
    end

    def exist_quota_on_event
        unless event.limit.to_i >= self.total_limit 
            errors.add(:total_leftover, "can't be greater than the limit from event")
        end
        unless  self.total_leftover <= self.total_limit
            errors.add(:total_leftover, "can't be greater than the limit from total_limit ")
        end
    end

    def sell_ticket(people)
        update!(total_leftover: self.total_leftover - people.to_i )
    end
    def exist_quota?(people)
        self.total_leftover - people.to_i >= 0
    end
end
