class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  has_one :client_user
  has_one :admin_user
  has_one :stand_user
  enum user_type: {admin: 0, stand:1 ,client_user: 2}

  def assign_type(user_type)
    update!(user_type: user_type)
  end
end
