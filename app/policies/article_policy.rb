class ArticlePolicy < ApplicationPolicy
  
  def index?
    true
  end

  def new? ; editor? ; end

  def create? ; editor? ; end

  def show? 
    user.present?
  end

  def update? ; editor_and_author? ; end

  def destroy? ; editor_and_author? ; end

  private

    def article
      record
    end

    def editor?
      user && user.role == 'editor' 
    end

    def editor_and_author?
      user && user.role == 'editor' && record.user_id == user.id
    end
end
