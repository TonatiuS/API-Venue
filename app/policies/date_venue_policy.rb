class DateVenuePolicy < ApplicationPolicy

  def index?
    return  true if user.admin? 
    false
  end

  def show?
    return  true if user.admin? 
    false
  end

  def create?
    return  true if user.admin? 
    false
  end

  def update?
    return  true if user.admin? 
    false
  end

    class Scope < Scope
 
      def resolve
        return scope.none if %w(stand client_user).include? user.user_type
        return scope.all
        scope.none 
 
      end
 
    end
 
  end 