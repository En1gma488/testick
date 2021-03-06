class ApplicationPolicy
  attr_reader :user, :current_user

  def initialize(user, current_user)
    @user = user
    @current_user = current_user

  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    true
  end

  def edit?
    true
  end

  def destroy?
    true
  end

  protected

  def admin_user?
     user.present? && user.admin?
  end

  def deactivated_user?
    user.present? && user.deactivated?
  end

  def activated_user?
    user.present? && user.activated?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
