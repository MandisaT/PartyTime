class UsersController < ApplicationController
  def index
  		@users = User.all 
  	end
  	def show 
  		@user = User.find(params[:id])
  	end 

	def destroy
	    User.find(params[:id]).destroy
	    flash[:success] = "User deleted"
	    redirect_to new_user_path
	end
	def new
  # behind the scenes does not require a view page in order to show a page and
  # avoid an error redirect to a get show / index 
    @user =User.new
	end

	def create  
	@user = User.new(user_params)
	# creating a new record in the system 
	if @user.save
		# saving the records 
		flash[:notice] = "Yeah step one to the party."
		redirect_to  user_path @user
		# redirecting to the show page for this user 
	else
		flash[:alert] = "There was a problem lets try again"
		redirect_to new_user_path
	end
end
def edit
    @user =User.find(params[:id]) 
end

def update
 @user = User.find(params[:id])
 @user.update(user_params) 
 redirect_to  user_path @user 
end 

private 

def user_params
params.require(:user).permit(:fname, :lname, :email, :password_digest , :password )

end 
end
