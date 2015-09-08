class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.last(5)
  end
  def index
    if current_user
      @user = User.all
      @articles = Article.all.paginate(page: params[:page], per_page: 10)
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

  def edit
    if current_user
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end

  end

  def update
    if current_user
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        redirect_to @user
      else
        render 'edit'
      end
    else
      redirect_to log_in_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :name, :mob, :age)
  end
end
