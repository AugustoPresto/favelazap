class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article = @article
    @comment.user = current_user
    authorize @comment
    if @comment.save
      redirect_to article_path(@article, anchor: "comment-#{@comment.id}")
    else
      render 'articles/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
