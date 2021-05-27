class PagesController < ApplicationController
  def home
  end

  def news
    @articles = policy_scope(Article).order(created_at: :desc)
  end
  
  def profile
    edit
  end

  def edit
    @user = current_user
    authorize @user 
  end

  def update
    @user.update(user_params)
    authorize @user 
    redirect_to profile_path
  end

end
