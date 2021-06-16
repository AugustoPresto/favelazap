class PagesController < ApplicationController
  before_action :set_user, only: [ :news, :profile, :my_articles]

  def home
    @user = current_user if user_signed_in?

    @communities_coordinates = [
      {
        # name: "Rocinha",
        lat: -22.99099588400901,
        lng: -43.24499929499648,
        image_url: helpers.image_path('green-marker-logo5.png')
      },
      {
        # name: "Vidigal",
        lat: -22.994302256653764,
        lng: -43.23629338728503,
        image_url: helpers.asset_url('green-marker-logo5.png')
      },
      {
        # name: "Borel",
        lat: -22.93902929858994,
        lng: -43.25445622057097,
        image_url: helpers.asset_url('green-marker-logo5.png')
      },
      {
        # name: "Formiga",
        lat: -22.941656259456693,
        lng: -43.24329628500983,
        image_url: helpers.asset_url('green-marker-logo5.png')
      },
      {
        # name: "Macacos",
        lat: -22.91071461310457,
        lng: -43.25803683224793,
        image_url: helpers.asset_url('green-marker-logo5.png')
      },
      {
        # name: "Alemão",
        lat: -22.858535733839737,
        lng: -43.2709371723786,
        image_url: helpers.asset_url('green-marker-logo5.png')
      },
      {
        # name: "Antares",
        lat: -22.920388778465853,
        lng: -43.658077108961216,
        image_url: helpers.asset_url('green-marker-logo5.png')
      },
      {
        # name: "Jacaré",
        lat: -22.88664969857775,
        lng: -43.256949875469886,
        image_url: helpers.asset_url('green-marker-logo5.png')
      },
      {
        # name: "Chapadão",
        lat: -22.8234061856209,
        lng: -43.374269457909705,
        image_url: helpers.asset_url('green-marker-logo5.png')
      },
      {
        # name: "Terreirao",
        lat: -23.024714795290148,
        lng: -43.47940388707926,
        image_url: helpers.asset_url('green-marker-logo5.png')
      }
    ]
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
