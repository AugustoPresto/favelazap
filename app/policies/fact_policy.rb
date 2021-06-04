class FactPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def create?
    user.reporter
  end

  def update?
    user.reporter
  end

  def destroy?
    user.reporter
  end

  def news?
    !user.reporter
  end
end
