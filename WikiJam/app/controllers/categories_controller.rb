class ArticlesController < ActionController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(name: (params[:name]))
  end
end
