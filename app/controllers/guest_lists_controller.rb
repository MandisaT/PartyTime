class GuestListsController < ApplicationController
  
		def new 
			 @guest_list = GuestList.new
			 @event = params[:event_id]
			  
		end
	  
	  def show
	  	@guest_list =GuestList.find(params[:id])
	  end 

	  def create
	  	@guest_list= GuestList.new(guest_params)
		# creating a new record in the system 
		if @guest_list.save
			# saving the records 
			
			redirect_to  guest_lists_path @guestlist
		
			# redirecting to the show page for guest
		else
			
			redirect_to new_guest_list_path
	  end
	end 
	  
	  
	 def index
	 	@user = current_user
	 	@events = @user.events
	  end
	  def edit
	  	  @guest_list =GuestList.find(params[:id]) 
	  end 

	def update
		 @guest_list = GuestList.find(params[:id])
		 @guest_list.update(guestlist_parmas) 
		 redirect_to  guest_list_path @user 
	end 
	def destroy
	   GuestList.find(params[:id]).destroy
	    flash[:success] = "User deleted"
	    redirect_to guest_list_user_path
	end
	private 

	def guest_params
		params.require(:guest_list).permit(:fname, :lname, :event_id, :email, :extra_guest, :dietary_type)

	end 
end
