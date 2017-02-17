class CitationsController < ApplicationController
  # before_action :find_article

  def index
    @citations = Citation.all
  end

  def new
    @citation = Citation.new
  end

  def create
    @citation = @article.citaions.new(citation_params)
    @article.creator_id = current_user.id
  end

  private
  # def find_article
  #   @article = Article.find(params[:article_id])
  # end

  def citation_params
    params.require(:citation).permit(:citation_body)
  end
end
