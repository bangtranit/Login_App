class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new user_params
		if @user.save
			flash[:success] = "save ok"
			log_in @user
			redirect_to users_path
		else
			flash[:success] = "save failed"
			render :new
		end
	end

	def show
		@user = User.find_by id:params[:id]
		flash[:success] = "aaaa"
	end

	def destroy
	end

	private
		def user_params
			params.require(:user).permit :name, :password, :password_confirmation
		end

end
