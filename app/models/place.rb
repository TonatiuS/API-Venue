class Place < ApplicationRecord
    has_many :events
    belongs_to :state

end
