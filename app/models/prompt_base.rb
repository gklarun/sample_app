class PromptBase
	def initialize( args = {})
		@markdown_text = args[:markdown_text]
		@partial_title = args[:partial]
	end

	attr_accessor :partial_title, :markdown_text
end


