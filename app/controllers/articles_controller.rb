class ArticlesController < ApplicationController

	#require 'ParserService'
  	def show
		@search_term = "us"
		@articles = ParserService.top_headlines(@search_term)
  	end
end
