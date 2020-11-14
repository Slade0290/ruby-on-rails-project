class SessionsPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def home?
    false
  end

  def index?
    false
  end

  def show?
    false
  end

  def new?
    false  
  end

  def create?
    false
  end

  def update?
    false
  end

  def destroy?
    false
  end
  
end
