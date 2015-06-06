class Topic < ActiveRecord::Base
	has_many :posts, dependent: :destroy

	validates :name, length: { minimum: 5 } , presence: true

	self.per_page = 50

	#Topic.visible_to is equivalent to Topic.where(public: true).
	#scope :visiable_to, -> {where(public: true)}

	scope :visible_to, -> (user) { user ? all : where(public: true )}

end