class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(name: (params[:name]))
    redirect_to 'articles#index'
  end
end
