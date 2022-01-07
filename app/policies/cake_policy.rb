class CakePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.admin?
    #return true
  end

  def show?
    return true
    #user.admin?
    #record.user == user
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
