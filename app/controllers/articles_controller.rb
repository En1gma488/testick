class ArticlesController < ApplicationController
	# before_action :authenticate_user!
	# skip_before_action :authenticate_user!, only: [:show, :index, :fatch_import]

	def index
		@articles = Article.all.paginate(page: params[:page], per_page: 7)
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
	  @article = Article.new(article_params)
	  if @article.save
	   flash[:notice] = "Article was successfully created"
	   redirect_to article_path(@article)
	  else
	   render 'new'
	  end
	end

	def edit
		@article = Article.find(params[:id])
		  if @article.update(article_params)
		   flash[:notice] = "Article was updated"
		   redirect_to article_path(@article)
		  else
		   flash[:notice] = "Article was not updated"
		   render 'edit'
  end
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

  	private
	  def article_params
	   params.require(:article).permit(:source_id, :title, :description, :url, :url_to_image,
    									:published_at)
	  end
end
