class Ticket < ApplicationRecord
    has_many :event
    has_many :client_users, through: :history_tickets
end
