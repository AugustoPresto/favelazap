class FactsController < ApplicationController
  before_action :set_fact, only: [:edit, :update, :destroy]
  before_action :set_user

  def new
    @fact = Fact.new
    @all_communities = %w(Rocinha Vidigal Borel Formiga Macacos Barbante Rola)
    @all_interests = %w(Sports Politics Social Security Economy)
    authorize @fact
  end

  def create
    @fact = Fact.new(fact_params)
    @fact.user = current_user
    @fact.communities.reject! { |e| e == "" }
    @fact.interests.reject! { |e| e == "" }
    authorize @fact
    if @fact.save
      redirect_to fact_path(@fact)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @fact.update(fact_params)
    redirect_to fact_path(@fact)
  end

  def destroy
    @fact.destroy
    redirect_to my_facts_path
  end

  private

  def fact_params
    params.require(:fact).permit(:title, :photo, communities: [], interests: [])
  end

  def set_fact
    @fact = Fact.find(params[:id])
    authorize @fact
  end

  def set_user
    @user = current_user
  end
end
