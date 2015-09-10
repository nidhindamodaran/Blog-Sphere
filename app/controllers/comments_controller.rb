class CommentsController < ApplicationController
  before_filter :find_article
  def create
    @comment = @article.comments.new(comment_params)
    @comment.commenter = current_user.email
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
