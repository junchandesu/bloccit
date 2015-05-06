class PostPolicy < ApplicationPolicy


	class Scope
    	attr_reader :user, :scope

    	def initialize(user, scope)
     	 @user = user
     	 @scope = scope
    	end

    	def resolve
     		if user.admin? || user.moderator?
        		scope.all
      		elsif user.present? && record.user == user
        		#scope.where(:published => true)
        		Post.where(user_id: user.id)
        		
        	else
        		nil
      		end
    	end

	end

	def index?
		true
		#user.post.admin?

	 end

 end