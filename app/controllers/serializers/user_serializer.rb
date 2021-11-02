class Api::V1::UserSerializer < Api::V1::ApplicationSerializer
  attributes  :id,
              :email,
              :user_type,
              :is_active,
              :info
  def info
    user_decorate = object.decorate
    {
      id: user_decorate.relation_id,
      full_name: user_decorate.user_full_name,
      user_type: user_decorate.user_type
    }
  end
end
