class PagesController < ApplicationController
  def home
    @user = current_user if user_signed_in?
  end

  def news
    @user = current_user
    @all_articles = policy_scope(Article).order(created_at: :desc)
    @articles = @all_articles.select do |article|
      !(@user.communities & article.communities).empty? && !(@user.interests & article.interests).empty?
    end
    authorize @articles
  end

  def profile
    @user = current_user
    authorize @user 
  end

  def update
    @user.update(user_params)
    authorize @user 
    redirect_to profile_path
  end
end
