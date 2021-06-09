class FactsController < ApplicationController
  before_action :set_fact, only: [:edit, :update, :destroy]

  def new
    @fact = Fact.new
    authorize @fact
  end

  def create
    @fact = Fact.new(fact_params)
    @fact.user = current_user
    @fact.communities.reject! { |e| e == "" }
    @fact.interests.reject! { |e| e == "" }
    authorize @fact
    if @fact.save
      redirect_to my_facts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @fact.update(fact_params)
    redirect_to my_facts_path
  end

  def destroy
    @fact.destroy
    redirect_to my_facts_path
  end

  def my_facts
    authorize(:fact, :my_facts?)
    @facts = current_user.facts.order(created_at: :desc)
  end

  private

  def fact_params
    params.require(:fact).permit(:title, :photo, communities: [], interests: [])
  end

  def set_fact
    @fact = Fact.find(params[:id])
    authorize @fact
  end
end
