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
<<<<<<< HEAD
>>>>>>> hw-34
=======

	validates :title, length: { minimum: 5 }, presence: true
	validates :body, length: { minimum: 20 }, presence: true
	validates :topic, presence: true
	validates :user, presence: true

	def markdown_title
		render_as_markdown(title)
		
	end

	def markdown_body
		render_as_markdown(body)
<<<<<<< HEAD
		
=======
>>>>>>> hw-39
	end

	private

	def render_as_markdown(text)
		renderer= Redcarpet::Render::HTML.new
		extensions = {fenced_code_blocks: true}
		@redcarpet = Redcarpet::Markdown.new(renderer, extensions)
<<<<<<< HEAD
		(@redcarpet.render  text).html_safe
=======
		(@redcarpet.render text).html_safe
>>>>>>> hw-39
	end




>>>>>>> hw-37-markdown
end

