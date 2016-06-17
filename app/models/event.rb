class Event < ActiveRecord::Base
		belongs_to :user
		has_many :products
		has_many :guestlists
	

end
