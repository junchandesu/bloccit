class PostPolicy < ApplicationPolicy


	class Scope
    	attr_reader :user, :scope

    	def initialize(user, scope)
     	 @user = user
     	 @scope = scope
    	end

    	def resolve
<<<<<<< HEAD
<<<<<<< HEAD
        if !user.present? # if there is no user signed in, load no posts
          scope.none
        elsif user.admin? || user.moderator?
          scope.all
        else
         #scope.where(id: user.posts.select(:id))
          scope.where(id: user)
       end
end
=======
     		if user.admin? || user.moderator?
        		scope.all
      		elsif user.present? && record.user == user
        		#scope.where(:published => true)
        		Post.where(user_id: user.id)
        		
        	else
        		scope.none
      		end
    	end
>>>>>>> hw-37-markdown
=======
     
        if !user.present?
          scope.none
        elsif user.admin? || user.moderator?
          scope.all?
        else
          scope.where(user_id: user.id).exists

        end
>>>>>>> hw-39

	end

	def index?
		true
		#user.post.admin?

	end

 end
end