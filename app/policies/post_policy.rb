class PostPolicy < ApplicationPolicy


  class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
       @user = user
       @scope = scope
      end

      def resolve
     
        if !user.present?
          scope.none
        elsif user.admin? || user.moderator?
          scope.all?
        else
          scope.where(user_id: user.id).exists

        end

  end

  def index?
    true
    #user.post.admin?

  end


  def show?
    user.present?
  end

  def desroy?
    user.present? && (uer.admin? || user.moderator?)
  end
 end


end