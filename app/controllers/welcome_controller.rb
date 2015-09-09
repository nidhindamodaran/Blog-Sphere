class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to users_path
    else
      render :layout => 'welcome_layout'
    end
  end
end
