class ProductsController < ApplicationController
	def index
    	@products = Product.all
  	end
  	def new 
  		@product = Product.new
 	end 
  

  	def create
		@product = Product.new(product_params)
		# creating a new record in the system 
		if @product.save
			# saving the records 
		
			redirect_to products_path
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
