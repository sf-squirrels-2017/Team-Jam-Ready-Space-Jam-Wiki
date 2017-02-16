class ArticlesController < ActionController
  def index
    @categories = Category.all
  end
end
