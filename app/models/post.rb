class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :user
<<<<<<< HEAD
	default_scope { order('created_at DESC')}
	scope :ordered_by_title, -> {  order('title ASC')}
	scope :ordered_by_reverse_created_at, ->{ order('created_at')}
=======
	belongs_to :topic
	has_one :summary
	default_scope { order('title DESC')}
>>>>>>> hw-34
end

