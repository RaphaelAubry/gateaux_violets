class BasketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.where(user_id: user.id)
    end
  end

  def create?
    return true
  end

  def show?
    record.user == user || user.admin?
  end

  def update?
    record.user == user || user.admin?
  end


  def destroy?
    record.user == user || user.admin?
  end

  def invoice?
    record.user == user || user.admin?
  end

end
