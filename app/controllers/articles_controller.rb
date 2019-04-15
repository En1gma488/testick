class ArticlesController < ApplicationController
	#def index
	 #  @articles = HTTParty.get('https://newsapi.org' )
  	#end
	require 'Parser'
  	def show
  		@search_term = "us"
	    @articles = Parser.top_headlines(@search_term)
  	end
end
