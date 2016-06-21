class AddGuestListEvents < ActiveRecord::Migration
  def change
  	add_column :events, :guest_list_id, :integer
  end
end
