class CakePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def show?
      true
      #user.admin?
      #record.user == user
    end

    def create?
      user.admin?
      #return true
    end

    def update?
      user.admin?
      #record.user == user
    end

    def destroy?
      user.admin?
      #record.user == user
    end
end
