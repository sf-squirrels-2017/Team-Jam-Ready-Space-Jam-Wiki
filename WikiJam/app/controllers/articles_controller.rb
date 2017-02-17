class ArticlesController < ApplicationController
  before_action :find_category
  before_action :find_article, only: [:show, :edit, :update, :destroy]


  def index
    if params[:search]
      @articles = Article.search(params[:search]).order("created_at DESC")
    else
      @articles = @category.articles
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = @category.articles.new(article_params)
    @article.creator_id = current_user.id
    if @article.save
      redirect_to [@category, @article]
    else
      render 'new'
    end
  end

  def show
    # @article = Article.find(params[:id])
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to [@category, @article]
    else
      render 'new'
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  private

  def find_category
    if params[:category_id]
      @category = Category.find(params[:category_id])
    end
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:article_body, :article_title)
  end

end
