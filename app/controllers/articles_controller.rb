class ArticlesController < ApplicationController
  # before_action :set_article

  def index
    @articles = policy_scope(Article).order(created_at: :desc)
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    authorize @article
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end


  private

  def article_params
    params.require(:article).permit(:title, :subtitle, :content, communities: [], interests: [])
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
