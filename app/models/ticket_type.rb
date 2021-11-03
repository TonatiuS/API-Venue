class TicketType < ApplicationRecord
    belongs_to :event
    has_many :tickets

    enum type: {vip: 0, plus: 1, standar: 2  }
end
