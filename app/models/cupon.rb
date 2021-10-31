class Cupon < ApplicationRecord
    belongs_to :ticket, optional: true
end
