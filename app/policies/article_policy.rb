class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    return true if user
  end

  def create?
    user_is_editor?
  end

  def destroy?
    user_is_owner?
  end

  def update?
    user_is_owner?
  end

  private

  def user_is_owner?
    user == record.user
  end

  def user_is_editor?
    user && user.editor
  end
end
