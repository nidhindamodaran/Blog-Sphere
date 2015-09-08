class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.last(5)
  end
  def index
    if current_user
      @user = User.all
      @articles = Article.all
    else
      redirect_to log_in_path
    end
  end

  def new
    if current_user
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render "new"
    end

  end
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
