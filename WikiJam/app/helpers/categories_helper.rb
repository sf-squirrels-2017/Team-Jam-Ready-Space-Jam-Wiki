module CategoriesHelper

  def categories
    @categories = Category.all
  end
end