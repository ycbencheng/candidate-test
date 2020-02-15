class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      articles = []
      unless !user?
        articles = scope.all
      end
      articles
    end
  end
end
