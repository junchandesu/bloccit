class SummaryPolicy < ApplicationPolicy

	def index
		true
	end


	def create?
		user.present? || user.admin?
	end

	def update?
		create?
	end
 
 	def new?
    	create?
  	end

end
