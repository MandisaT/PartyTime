class Event < ActiveRecord::Base
		belongs_to :user
		has_many :products
		has_one :guest_list
	# def  future 
	# 		date_now = Date.today 
	# 		days = (date_now - event.date)
	# 		flash[:notice] = " You have #{days} to plan this party"
	# end  

end

