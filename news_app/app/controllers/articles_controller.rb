class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  after_action :verify_authorized, only: [:new]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      flash[:success] = "Article was saved successfully."
      redirect_to @article
    else
      flash.now[:alert] = "Error creating article. Please try again."
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def update
    @article = Article.find(params[:id])

    @article.assign_attributes(article_params)

    if @article.save
      flash[:notice] = "Article was updated."
      redirect_to @article
    else
      flash.now[:alert] = "Error saving article. Please try again."
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    if @article.destroy
      flash[:notice] = "\"#{@article.title}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the topic."
      render :show
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :category)
  end
end
