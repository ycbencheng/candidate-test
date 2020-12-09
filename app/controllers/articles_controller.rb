class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @articles = Article.where(category: params[:category])
    @articles = policy_scope(@articles)
    @category = Category.find(params[:category])
    authorize @articles
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end

  def new
    @article = Article.new
    @categories = Category.all.uniq
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @category = params[:article][:category].to_i
    @article.category = Category.find(@category)

    authorize @article
    if @article.save!
      redirect_to article_path(@article)
    else
      flash[:notice] = @article.errors.full_messages
    end
  end

  def edit
    @article = Article.find(params[:id])
    @categories = Category.all.uniq
    authorize @article
  end

  def update
    @article = Article.find(params[:id])
    @category = params[:article][:category].to_i
    @article.category = Category.find(@category)
    authorize @article
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      flash[:notice] = @article.errors.full_messages
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
