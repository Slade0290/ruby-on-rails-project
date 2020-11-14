class UsersPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def home?
    true
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    true  
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    false
  end
  
end
