class ClientUser < ApplicationRecord
    belongs_to :user
    has_many :tickets, through: :history_tickets
end
