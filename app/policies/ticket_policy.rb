class TicketPolicy < ApplicationPolicy

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