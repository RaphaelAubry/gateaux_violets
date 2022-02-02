class BasketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin? ? scope.all.order(created_at: :desc) : scope.where(user_id: user.id).order(created_at: :desc)
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
