class CitationsController < ApplicationController
  before_action :find_category
  before_action :find_article

  def index
    @citations = @article.citations
  end

  def new
    @citation = Citation.new
  end

  def create
    @citation = @article.citations.new(citation_params)
    @citation.user_id = current_user.id
    if @citation.save
      redirect_to [@category, @article]
    else
      render 'new'
    end
  end

  private

  def find_category
    if params[:category_id]
      @category = Category.find(params[:category_id])
    end
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

  def citation_params
    params.require(:citation).permit(:body)
  end
end
