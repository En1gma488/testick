class ArticlePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    # admin_user? || @user == @current_user
    # user.present?
    # user.user? || user.admin?
    # user.admin? && activated_user?
    true
  end

  def create?
    # admin_user? && activated_user?
    # @user.admin?
    true
  end

  def new?
    create?
  end

  def update?
    @user.admin?  
  end

  def edit?
    user.admin?
  end

  def destroy?
    @user.admin?
  end
end