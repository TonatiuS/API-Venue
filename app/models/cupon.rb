class Cupon < ApplicationRecord
    belongs_to :ticket, optional: true

    def cupon_valid?
        return true if self.total.count > 0
        false
    end
end
