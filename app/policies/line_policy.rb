class LinePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def show?
    record.user == user || user.admin?
  end

  def update?
    record.basket.user == user || user.admin?
  end

  def destroy?
    record.basket.user == user || user.admin?
  end
end
