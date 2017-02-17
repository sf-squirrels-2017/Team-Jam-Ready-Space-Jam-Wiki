class CitationsController < ApplicationController
  before_action :find_article

  def index
    @citations = @article.citations
  end

  def new
    @citation = Citation.new
  end

  def create
    @citation = @article.citations.new(citation_params)
    @citation.creator_id = current_user.id
    if @citation.save
      redirect_to [@article]
    else
      render 'new'
    end
  end

  private
  def find_article
    if params[:article_id]
      @article = Article.find(params[:article_id])
    end
  end

  def citation_params
    params.require(:citation).permit(:citation_body)
  end
end
