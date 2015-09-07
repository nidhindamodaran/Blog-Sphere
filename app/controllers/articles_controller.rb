class ArticlesController < ApplicationController

  def show
    if current_user
      @user = User.find(current_user.id)
      #@article = @user.articles.find(params[:id])
      @article = Article.find(params[:id])
    else
      redirect_to log_in_path
    end
  end
  def new
    if current_user
      @user = User.find(current_user.id)
      @article = @user.articles.new
    else
      redirect_to log_in_path
    end
  end

  def edit
    if current_user
      @user = User.find(current_user.id)
      @article = @user.articles.find(params[:id])
    else
      redirect_to log_in_path
    end
  end

  def create
    @user = User.find(current_user.id)
    @article = @user.articles.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end

  def update
    if current_user
      @user = User.find(current_user.id)
      @article = @user.articles.find(params[:id])
      if @article.update(article_params)
        redirect_to @article
      else
        render "edit"
      end
    else
      redirect_to log_in_path
    end
  end

  def destroy
    if current_user
      @user = User.find(current_user.id)
      @article = @user.articles.find(params[:id])
      @article.destroy

      redirect_to root_path
    else
      redirect_to log_in_path
    end

  end


  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
