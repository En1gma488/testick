class ArticlePolicy 
  attr_reader :user, :current_user

  def initialize(user, current_user)
    @user = user
    @current_user = current_user

  end

  def index?
    true
  end

  def show?
    # admin_user? || @user == @current_user
    # user.present?
    # @current_user.admin?
    true
  end

  def create?
    # admin_user? && activated_user?
    # @current_user.admin?
    true
  end

  def new?
    create?
  end

  def update?
    admin_user? && activated_user?
  end

  def edit?
    update?
  end

  def destroy?
    admin_user? && activated_user?
  end
end