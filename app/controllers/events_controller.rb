class EventsController < ApplicationController
	def index
		@events = Event.all
	end
	def edit 
		@event = Event.find(params[:id])
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
			redirect_to  event_path @event
			# redirecting to the show page for this event
		else
			flash[:alert] = "There was a problem lets try again"
			redirect_to new_event_path
		end
	end 
	
	def show
	    @event = Event.find(params[:id])
	    @guest_list = GuestList.new
	    @product = Product.new
	    @total = total(@event)
	    date_now = Date.today 
		days = (@event.date - date_now)
		flash[:notice] = " You have #{days} days to plan this party"
	end

	
	def total(event) 
		total_cost = 0
		event.products.each do |product|
			total_cost += product.price * product.quantity
		end
		total_cost
	end 
    def update
    	@event = Event.find(params[:id])
 		@event.update(event_params) 
 		redirect_to event_path @event
    end 

	def shopping_cart(event)
		event.products.each do |product|
		remaining_budget -= product.price * product.quantity
		end
 		remaining_budget
	end
	
	# def days_until (event_date)
	# 	now = Date.current_user
	# 	event_date = now.year - event.year
	# 	event_date = now.day - event.day 
	# end 
	
	# def days_until_party(event_date)
	# 	now = Time.now.to_date
	# 	now.year - event_date.date - ((now.month > event_date.date || (now.month == event.date && now.day)))
	# end 
	# def future
	# 	day.future
 #    end 
	
	def destroy
	  Event.find(params[:id]).destroy
	    flash[:success] = "User deleted"
	    redirect_to new_event_path
	end
		 
	private
	# thinking of this similiar to the the post controller which is why  i merged the user_id and current_user so it can 
	# print out the user_id and connects 
	# read up more on associations in models and see how  it works 
	def event_params
		 params.require(:event).permit(:user_id,:party_type,:name ,:adress,:date,:budget,:product_id).merge(user: current_user)
	end 

end 
