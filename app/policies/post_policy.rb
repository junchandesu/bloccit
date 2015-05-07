class PostPolicy < ApplicationPolicy


	class Scope
    	attr_reader :user, :scope

    	def initialize(user, scope)
     	 @user = user
     	 @scope = scope
    	end

    	def resolve
        if !user.present? # if there is no user signed in, load no posts
          scope.none
        elsif user.admin? || user.moderator?
          scope.all
        else
         scope.where(id: user.posts.select(:id))
       end
end

	end

	def index?
		true
		#user.post.admin?

	 end

 end