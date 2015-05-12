class CommentPolicy < ApplicationPolicy


	def create?
		 user.present? 
	end

 
 	# def new?
  #   	user.present?
  # 	end

end
