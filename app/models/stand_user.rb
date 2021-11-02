class StandUser < ApplicationRecord
    belongs_to :user
    validates :user_id, uniqueness: true
    
    after_create :update_user

    def update_user
        self.user.assign_type("stand")
    end
end
