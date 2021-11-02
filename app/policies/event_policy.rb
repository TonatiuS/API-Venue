class EventPolicy < ApplicationPolicy

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
    return  true if user.admin? || user.stand?
    false
  end

    class Scope < Scope
 
      def resolve
        return scope.all
        scope.none 
 
      end
 
    end
 
  end 