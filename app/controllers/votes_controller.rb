class VotesController < ApplicationController
  before_filter :find_article
  def create
    @votes = @article.votes.new
    @votes.voter = current_user.id
    @votes.save
    redirect_to article_path(@article)
  end
  def destroy
    @votes = @article.votes.find(params[:id])
    @votes.destroy
    redirect_to article_path(@article)


  end
end
