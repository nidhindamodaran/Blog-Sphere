class ArticlesController < ApplicationController
  def show
    @user = User.find(current_user)
    @article = @user.articles.find(params[:id])
  end
  def new
    @user = User.find(current_user)
    @article = @user.articles.new
  end

  def edit
    @user = User.find(current_user)
    @article = @user.articles.find(params[:id])
  end

  def create
    @user = User.find(current_user)
    @article = @user.articles.new(article_params)
    @article.user_id = current_user
    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end

  def update
    @user = User.find(current_user)
    @article = @user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(current_user)
    @article = @user.articles.find(params[:id])
    @article.destroy

    redirect_to root_path

  end


  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
