class ArticlesController < ApplicationController
  before_action :find_category

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

  end

  def edit

  end

  def show

  end

  def update

  end

  def destroy

  end

  private

  def find_category
    if params[:category_id]
      @category = Category.find(params[:category_id])
    end
  end

  def article_params
    params.require(:article).permit(:article_body, :article_title)
  end

end
