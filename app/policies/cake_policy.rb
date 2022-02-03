class CakePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user && user.admin? ? scope.all : scope.where(active: true)
    end
  end

  def create?
    user.admin?
    #return true
  end

  def show?
    record.active == true || user.admin?
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
