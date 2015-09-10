class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :admin?

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def admin?
    return true if current_user.email == "admin@spherebyte.in"
  end

  def login_required
    redirect_to new_session_path unless current_user
  end

  def find_article
    @article = Article.find(params[:article_id])
  end
end
