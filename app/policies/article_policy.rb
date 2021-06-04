class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.reporter
  end

  def show?
    true
  end

  def update?
    user.reporter
  end

  def destroy?
    user.reporter
  end

  def my_articles?
    user.reporter
  end

  def news?
    !user.reporter
  end
end
