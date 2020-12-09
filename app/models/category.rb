class Category < ApplicationRecord
  has_many :articles, dependent: :destroy

  def last_3_articles
    articles.order(created_at: :desc).limit(3)
  end
end
