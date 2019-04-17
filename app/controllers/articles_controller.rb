class ArticlesController < ApplicationController
	before_action :authenticate_user!
	skip_before_action :authenticate_user!, only: [:show, :index]
	#require 'ParserService'
	def index
		#@search_term = "us"
		# @articles = ParserService.top_headlines(@search_term)
		@articles = Article.all
		#@articles = Article.all.paginate(page: params[:page], per_page: 7s)
		#render json: @articles
	end

  	def show

  	end
end
