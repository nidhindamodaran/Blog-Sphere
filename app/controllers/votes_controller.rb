class VotesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @votes = @article.votes.new
    @votes.voter = current_user.id
    @votes.save
    redirect_to article_path(@article)
  end
  def destroy
    @article = Article.find(params[:article_id])
    @votes = @article.votes.find(params[:id])
    @votes.destroy
    redirect_to article_path(@article)


  end
end
