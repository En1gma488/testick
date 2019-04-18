class ArticlesController < ApplicationController
	# before_action :authenticate_user!
	# skip_before_action :authenticate_user! , only: [:show, :index, :render_article]
	#require 'ParserService'
	def index
		#@search_term = "us"
		# @articles = ParserService.top_headlines(@search_term)
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

  	def fatch_import
  		ParserService.new.render_article
  		redirect_to articles_path
  		flash[:success] = "You have updated"
  	end

  	def source_import
  		ParserService.new.render_source
  		redirect_to articles_path

  	end
end
