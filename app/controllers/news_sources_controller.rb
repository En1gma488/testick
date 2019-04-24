class NewsSourcesController < ApplicationController
  def index
    @sources = NewsSource.all
    
  end

  def show
    @source = NewsSource.find(params[:id])
    
  end

  def new
    @source = NewsSource.new
    
  end

  def edit
    @source = NewsSource.find(params[:id])
    
  end

  def create
    @source = NewsSource.new(source_params)
    
    if @source.save
      redirect_to news_sources_path
    else
      render 'new'
    end
  end

  def update
    @source = NewsSource.find(params[:id])
   
    if @source.update(source_params)
      redirect_to news_sources_path
    else
      render 'edit'
    end 
  end

  def destroy
    @source = NewsSource.find(params[:id])
    
    @source.destroy
    redirect_to news_sources_path
  end

  private

  def source_params
    params.permit(:google_id, :name)
  end
end
