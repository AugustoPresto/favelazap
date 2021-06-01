class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :set_user

  def index
    @articles = policy_scope(Article).order(created_at: :desc)
  end

  def new
    @article = Article.new
    @all_communities = %w(Rocinha Vidigal Borel Formiga Macacos Barbante Rola)
    @all_interests = %w(Sports Politics Social Security Economy)
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.communities.reject!{ |e| e.to_s == "" }
    @article.interests.reject!{ |e| e.to_s == "" }
    authorize @article
    if @article.save
      redirect_to my_articles_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to my_articles_path
  end

  def my_articles
    authorize(:article, :my_articles?)
    @articles = @user.articles
  end

  private

  def article_params
    params.require(:article).permit(:title, :subtitle, :content, :photo, communities: [], interests: [])
  end

  def set_article
    @article = Article.find(params[:id])
    authorize @article
  end

  def set_user
    @user = current_user
  end
end
