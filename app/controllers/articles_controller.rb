class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article
    if @article.save
      redirect_to news_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @user = current_user
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to my_news_path
  end

  def likes
    @user = current_user
    @article = Article.find(params[:id])
    if @article.users_likes.include?(@user.id)
      @article.users_likes = @article.users_likes.pop(@article.users_likes.find_index(@user.id))
    else
      @article.users_likes << @user.id
    end
    authorize @article
    @article.save!
    redirect_to article_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :subtitle, :content, :photo, communities: [], interests: [], users_likes: [])
  end

  def set_article
    @article = Article.find(params[:id])
    authorize @article
  end
end
