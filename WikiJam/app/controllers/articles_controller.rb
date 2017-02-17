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

#
# POST   /categories/:category_id/articles(.:format)          articles#create
# new_category_article GET    /categories/:category_id/articles/new(.:format)      articles#new
# edit_category_article GET    /categories/:category_id/articles/:id/edit(.:format) articles#edit
# category_article GET    /categories/:category_id/articles/:id(.:format)      articles#show
#  PATCH  /categories/:category_id/articles/:id(.:format)      articles#update
#  PUT    /categories/:category_id/articles/:id(.:format)      articles#update
#  DELETE /categories/:category_id/articles/:id(.:format)      articles#destroy
# categories GET    /categories(.:format)                                categories#index
# category GET    /categories/:id(.:format)                            categories#show
