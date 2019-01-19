module DefaultPageContent
	extend ActiveSupport::Concern

	included do 
		before_action :set_page_defaults
	end

	def set_page_defaults
		@page_title = "Devcamp Portfolio | My Portfolio Website"
		@seo_keywords = "Any kwrds you might want to set"
	end
end