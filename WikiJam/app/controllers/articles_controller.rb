class ArticlesController < ApplicationController
  before_action :find_category

  def index
    @articles = @category.articles
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
    @category = Category.find(params[:category_id])
  end

  def article_params
    params.require(:article).permit(:article_body, :article_title)
  end

end
