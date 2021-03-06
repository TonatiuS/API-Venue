class Event < ApplicationRecord
    belongs_to :place
    has_many :tickets
    has_many :date_venues
    has_many :ticket_types
    enum venue_type:{music: 0, theater: 1}
end
