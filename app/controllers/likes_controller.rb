class LikesController < ApplicationController
  before_action :find_article, :find_like, :liked?
  
  def create
    if liked?
      destroy
    else
      @article.likes.create(user_id: current_user.id)
      authorize @like
      redirect_to article_path(@article)
    end
  end
  
  def destroy
    @like = Like.find(Like.where(user_id: current_user.id, article_id: @article.id).ids.first)
    @like.destroy
    authorize @like
    redirect_to article_path(@article)
  end
  private
  
  
  def liked?
    Like.where(user_id: current_user.id, article_id: @article.id).exists?
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_like
    @like = Like.where(user_id: current_user.id, article_id: @article.id)
  end
end
