class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
  #  false
  user.present?
  end

  def new?
    create?
  end

  def update?
  #  false
       user.present? && (record.user == user || user.admin?)

  end

  def edit?
    update?
  end

  def destroy?
   # false
   update?
  end

  def scope
 #   Pundit.policy_scope!(user, record.class)
  record.class
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
