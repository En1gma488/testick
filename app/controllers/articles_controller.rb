class ArticlesController < ApplicationController
	# before_action :authenticate_user!
	# skip_after_action :verify_authorized, only: [:index]
	 # skip_before_action :authenticate_user!, only: %i[index]
	def index
		@articles = Article.all
		@articles = @articles.paginate(page: params[:page], per_page: 5)
		authorize @articles
	end

	def new
		@article = Article.new
		authorize @article
	end

	def show
		@article = Article.find(params[:id])
		authorize @article
	end

	def create
	  @article = Article.new(article_params)
	  authorize @article
	  if @article.save
	   flash[:notice] = "Article was successfully created"
	   redirect_to article_path(@article)
	  else
	   render 'new'
	  end
	end

	def edit
		@article = Article.find(params[:id])
		authorize @article
  	end

  	def update
  		@article = Article.find(params[:id])
		authorize @article
		if @article.update(article_params)
		   flash[:notice] = "Article was updated"
		   redirect_to article_path(@article)
		else
		   flash[:notice] = "Article was not updated"
		   render 'edit'
		end
  	end

	def destroy
		@article = Article.find(params[:id])
		authorize @article
		@article.destroy
		redirect_to articles_path, :notice => "Article deleted"
	end


  	def fatch_import
  		ParserService.new.render_article
  		redirect_to articles_path
  		flash[:success] = "Articles updated"
  	end

  	def source_import
  		ParserService.new.render_source
  		redirect_to articles_path
  	end

  	private
	  def article_params
	   params.require(:article).permit(:source_id, :title, :description, :url, :url_to_image,
    									:published_at, :image)
	  end
end
