class FlavourPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all if user.admin?
    end
  end

  def create?
    user.admin?
    #return true
  end

  def show?
    user.admin?
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
