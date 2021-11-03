class Cupon < ApplicationRecord
    has_many :tickets

    def cupon_valid?
        return true if  self.usos.to_i <= self.total.to_i  
        false
    end
end
