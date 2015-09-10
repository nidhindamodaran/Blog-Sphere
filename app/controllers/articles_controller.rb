class ArticlesController < ApplicationController
  before_filter :login_required
  before_filter :find_current_user
  
  def show
    @article = Article.find(params[:id])
    @vote = @article.votes.find_by_voter(current_user.id)
    @voted = false
    @article.votes.each do |vote|
      if vote.voter.to_i == current_user.id.to_i
        @voted = true
      end
    end
  end

  def new
      @article = @user.articles.new
  end

  def edit
      @article = @user.articles.find(params[:id])
  end

  def create
    @article = @user.articles.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end

  def update
      @article = @user.articles.find(params[:id])
      if @article.update(article_params)
        redirect_to @article
      else
        render "edit"
      end
  end

  def destroy
      @article = @user.articles.find(params[:id])
      @article.destroy

      redirect_to users_path
  end


  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  def find_current_user
    @user = User.find(current_user.id)
  end
end
