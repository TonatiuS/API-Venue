class ClientUser < ApplicationRecord
    belongs_to :user
    has_many :tickets, through: :history_tickets
    validates :user_id, uniqueness: true
    
    after_create :update_user

    def update_user
        self.user.assign_type("client_user")
    end
end
