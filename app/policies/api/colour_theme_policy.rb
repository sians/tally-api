class Api::ColourThemePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  private

  def is_owner?
    user == record.user
  end
end
