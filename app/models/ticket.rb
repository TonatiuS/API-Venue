class Ticket < ApplicationRecord
    belongs_to :event
    has_many :client_users, through: :history_tickets
end
