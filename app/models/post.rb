class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	belongs_to :topic
	has_one :summary
	default_scope { order('title DESC')}

	validates :title, length: { minimum: 5 }, presence: true
	validates :body, length: { minimum: 20 }, presence: true
	validates :topic, presence: true
	validates :user, presence: true

	def markdown_title
		render_as_markdown
		(@redcarpet.render  title).html_safe
	end

	def markdown_body
		render_as_markdown
		(@redcarpet.render body).html_safe
	end

	private

	def render_as_markdown
		renderer= Redcarpet::Render::HTML.new
		extensions = {fenced_code_blocks: true}
		@redcarpet = Redcarpet::Markdown.new(renderer, extensions)
		
	end




end
