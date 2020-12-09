class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user_and_admin?
  end

  def create?
    user_and_admin?
  end

  def update?
    user_and_admin?
  end

  private

  def user_and_admin?
    user && user.admin?
  end
end
