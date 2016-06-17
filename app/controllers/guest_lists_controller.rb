class GuestListsController < ApplicationController
  
		  def new 

			  	@guestlist = GuestList.new
			  
		end
	  def show
	  	@guest_list =GuestList.find(params[:id])
	  end 

	  def create
	  	@guest_list= GuestList.new(guest_params)
		# creating a new record in the system 
		if @guest_list.save
			# saving the records 
			
			redirect_to  guest_lists_path
			# redirecting to the show page for guest
		else
			
			redirect_to new_guest_list_path
	  end
	end 
	  
	  
	 def index
	  	@guest_lists =GuestList.all
	  end
	  def edit
	  	  @guest_list =GuestList.find(params[:id]) 
	  end 

	def update
		 @guest_list = GuestList.find(params[:id])
		 @guest_list.update(guestlist_parmas) 
		 redirect_to  user_path @user 
	end 
	private 

	def guest_params
		params.require(:guest_list).permit(:fname, :lname, :email, :extra_guest,:dietary_type)

	end 
end
