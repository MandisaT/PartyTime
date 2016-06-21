class ProductsController < ApplicationController
	def index
    	@event = Event.where(id: params[:event_id]).first
# products that belong to this specific event find the event where the id is equal to the event_id
    	@products = @event.products
  	end
 	def new 
  		@product = Product.new
  		@event = params[:event_id]  
 	end 

  	def edit
	  	@product =Product.find(params[:id]) 
	end 
 
  
 	def update 
 		@product = Product.find(params[:id])
		 @product.update(product_params) 
		 redirect_to  product_path @product
 	end 
 	def destroy
	   Product.find(params[:id]).destroy
	    flash[:success] = "product deleted"
	    redirect_to new_product_path
	
 	end 
 	def show 
 		@product =Product.find(params[:id])
 		@event = params[:id]  
 	end 
 

  	def create
		@product = Product.new(product_params)
		flash[:notice] = "Check you party cost"
		# creating a new record in the system 
		if @product.save
			# saving the records 
		
			redirect_to  event_path(@product.event)
			# redirecting to the show page for this user 
		else
			redirect_to new_product_path
			end
	end 

	private 

	def product_params
			params.require(:product).permit(:name, :price ,:quantity ,:event_id)
	end 
	
end
