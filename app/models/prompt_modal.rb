class PromptModal < PromptBase
	attr_accessor :partial_title, :markdown_text, :partial_footer, :partial_header, :partial

	def initialize( args = {})
		super
		@markdown_text = args[:markdown_text]
		@partial_title = args[:partial_title]
		@partial = args[:partial]
		@partial_footer = args[:partial_footer]
		@partial_header = args[:partial_header]
	end
end
