class UsersController < ApplicationController
	 before_action :authenticate_user!
	def index
		@users = User.all
		authorize @users
	end
	def show
  		@user = User.find(params[:id])
		@user_sources = NewsSource.find(@user.news_source_ids)
		authorize @user
	end

	def update
	    @user = User.find(params[:id])
	    authorize @user
	    if @user.update(user_params)
	      redirect_to users_path, notice: 'User updated.'
	    else
	      redirect_to users_path, alert: 'Unable to update user.'
	    end
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to users_path, notice: "User deleted"
	end

	private
	def user_params
	  params.require(:user).permit(:roll, :status, article_source_ids: [])
	end
end
