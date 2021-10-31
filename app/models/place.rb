class Place < ApplicationRecord
    belongs_to :event
    has_many :states

end
