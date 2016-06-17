class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def new
	  	@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		# creating a new record in the system 
		if @event.save
			# saving the records 
			flash[:notice] = "Yeah lets create this party ."
			redirect_to  events_path
			# redirecting to the show page for this event
		else
			flash[:alert] = "There was a problem lets try again"
			redirect_to new_event_path
		end
	end 
	
	def show
	    @event = Event.find(params[:id])
	    @total = total(@event)
	end

	
	def total(event) 
		total_cost = 0
		event.products.each do |product|
			total_cost += product.price * product.quantity
		end
		total_cost
	end 


	def shopping_cart(event)
		event.products.each do |product|
		remaining_budget -= product.price * product.quantity
		end
 		remaining_budget
	end
	
		 
	private
	# thinking of this similiar to the the post controller which is why  i merged the user_id and current_user so it can 
	# print out the user_id and connects 
	# read up more on associations in models and see how  it works 
	def event_params
		 params.require(:event).permit(:user_id,:party_type,:name ,:adress,:date,:budget).merge(user: current_user)
	end 

end 
