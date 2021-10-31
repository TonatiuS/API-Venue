class ClientUser < ApplicationRecord
    has_many :users
    has_many :tickets, through: :history_tickets
end
