class HistoryTicket < ApplicationRecord
    belongs_to :ticket
    belongs_to :client_user
end
