class TicketTypePolicy < ApplicationPolicy

    class Scope < Scope
 
      def resolve
        return scope.all
        scope.none 
 
      end
 
    end
 
  end 