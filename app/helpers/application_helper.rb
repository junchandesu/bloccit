module ApplicationHelper
	
	def form_group_tag(errors, &block)
		if errors.any?
			content_tag :div, capture(&block), class: 'form-group has-error'
		else
			content_tag :div, capture(&block), class: 'form-group'
		end
	end

	# def markdown_to_html(markdown)
	# 	renderer= Redcarpet::Render::HTML.new
	# 	extensions = {fenced_code_blocks: true}
	# 	redcarpet = Redcarpet::Markdown.new(renderer, extensions)
	# 	(redcarpet.render markdown).html_safe
	# end



	def up_vote_link_classes(post)
		arrow_up = 'glyphicon glyphicon-chevron-up' 
		voter = current_user.voted(post)
		dim = ''
		if  voter && voter.up_vote?
  		dim = ' voted' 
		end 
		arrow_up + dim
	end

 	def down_vote_link_classes(post)
 		arrow_down = 'glyphicon glyphicon-chevron-down'
 		voter = current_user.voted(post)
 		dim=''
 		if voter && voter.down_vote?
 		dim = ' voted'
 		end
 		arrow_down + dim
	end
end
