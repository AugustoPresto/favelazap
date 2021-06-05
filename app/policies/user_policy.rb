class UserPolicy < ApplicationPolicy
  def profile?
      @user == @record
  end
end
