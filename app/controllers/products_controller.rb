class ProductsController < ApplicationController
	def index
    	@products = Product.all
  	end
  	def new 
  		@product = Product.new
 	end 
  
 	def update 
 		@product = Product.find(params[:id])
		 @product.update(product_parmas) 
		 redirect_to  product_path @product
 	end 
 	def destroy
	   Product.find(params[:id]).destroy
	    flash[:success] = "User deleted"
	    redirect_to new_product_path
	
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
