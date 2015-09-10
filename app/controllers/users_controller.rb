class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  before_filter :find_user, :except => [:index, :new, :create]

  def show
      @articles = @user.articles.last(5)
  end

  def index
      @user = User.all
      @articles = Article.all.paginate(page: params[:page], per_page: 10)
  end

  def new
    if current_user
      redirect_to users_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
      if @user.update_attributes(user_params)
        redirect_to @user
      else
        render 'edit'
      end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :mob, :age)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
