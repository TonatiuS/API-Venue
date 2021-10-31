class Event < ApplicationRecord
    has_many :places
    has_many :date_venues
    has_many :ticket_types
    belongs_to :tickets
    #enum venue_type:{music: 0, theater: 1}
end
