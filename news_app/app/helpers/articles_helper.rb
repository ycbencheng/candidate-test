module ArticlesHelper
  def activity_feed
    @articles.order(created_at: :asc).limit(3)
  end

  def article_categories
    category_arr =[]
    @articles.each do |article|
      if category_arr.include?(article.category)
        next
      else
       category_arr.push(article.category)
      end
    end
    category_arr
  end

end
