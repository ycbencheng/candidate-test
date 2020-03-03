class ArticlePolicy < ApplicationPolicy
  
  def index?
    true
  end

  def create? ; editor? ; end

  def show? 
    user.present?
  end

  def update? ; editor? ; end

  def destroy? ; editor? ; end

  private

    def article
      record
    end

    def editor?
      user && user.role == 'editor' && record.user_id == user.id
    end
end
