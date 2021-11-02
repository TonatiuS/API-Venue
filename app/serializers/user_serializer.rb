class UserSerializer < ApplicationSerializer
    attributes  :id,
                :email,
                :user_type,
                :cel,
                :active,
                :name,
                :last_name,
                :updated_at,
                :created_at
  end
  