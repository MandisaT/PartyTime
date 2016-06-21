class GuestListsController < ApplicationController
   		def index
	 		@event = Event.where(id: params[:event_id]).first
	 		@guest_lists = @event.guest_lists
	 		# @events = @user.events
	  	end
		def new 
			@guest_list = GuestList.new
			 @event = params[:event_id]  
		end
	  
	   def edit
	  	  @guest_list =GuestList.find(params[:id]) 
	 	end 
	 	def update
		 @guest_list = GuestList.find(params[:id])
		 @guest_list.update(guest_params) 
		 redirect_to  guest_list_path @guest_list
	end 
	  
	  def destroy
	   GuestList.find(params[:id]).destroy
	   flash[:success] = "User deleted"
	   redirect_to new_guest_list_path
	end
	def show
	  	@guest_list =GuestList.find(params[:id])
	  	@event = params[:id] 

	  end 
	 def create
	  	@guest_list= GuestList.new(guest_params)
		# creating a new record in the system 
			if @guest_list.save
			# saving the records 
				
				redirect_to  event_path(@guest_list.event)
			
				# redirecting to the show page for guest
			else
				
				redirect_to new_guest_list_path
		  end
	end 
	
	private 

	def guest_params
		params.require(:guest_list).permit(:fname, :lname, :event_id, :email, :extra_guest, :dietary_type)
	end 
end
