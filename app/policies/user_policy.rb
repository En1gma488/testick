class UserPolicy < ApplicationPolicy

  def index?
    admin_user?
  end
end