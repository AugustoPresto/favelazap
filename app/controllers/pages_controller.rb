class PagesController < ApplicationController
  before_action :set_user, only: [ :news, :profile, :my_articles]

  def home
    @user = current_user if user_signed_in?
  end

  def news
    @user = current_user
    all_articles = policy_scope(Article).order(created_at: :desc)
    @articles = all_articles.select do |article|
      !(@user.communities & article.communities).empty? && !(@user.interests & article.interests).empty?
    end
    all_facts = policy_scope(Fact).order(created_at: :desc)
    @facts = all_facts.select do |fact|
      !(@user.communities & fact.communities).empty? && !(@user.interests & fact.interests).empty?
    end
    # authorize @articles
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

  def my_news
    @user = current_user
    authorize(:article, :my_articles?)
    @articles = @user.articles.order(created_at: :desc)
    authorize(:fact, :my_facts?)
    @facts = @user.facts.order(created_at: :desc)
  end

  private

  def set_user
    @user = current_user
  end

end
