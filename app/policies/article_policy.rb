class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.reporter
  end

  def show?
    !user.reporter
  end

end
