class CommentPolicy < ApplicationPolicy

  attr_reader :user, :record
	def destroy?
		user.present? && (record.user == user|| user.admin? || user.moderator?)
	end
	
end