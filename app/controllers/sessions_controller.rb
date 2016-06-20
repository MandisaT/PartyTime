class SessionsController < ApplicationController
	def new
	end
    

	def create
	
		@user = User.find_by(email: params[:email])
	
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			flash[:notice] = "Hey lets start planning this party !!!"
			redirect_to user_path @user
		else 
			flash[:alert] =	"dont be tardy for the party"
			redirect_to login_path
		end 
	end
	
	def destroy
		session[:user_id] =nil 
		flash[:notice] = "Logged Out"
		redirect_to login_path
	end 
end
 