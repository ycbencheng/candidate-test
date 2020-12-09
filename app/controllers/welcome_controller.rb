class WelcomeController < ApplicationController

  def index
    #Getting unique categories
    @categories = Article.all.map(&:category).uniq
  end
end