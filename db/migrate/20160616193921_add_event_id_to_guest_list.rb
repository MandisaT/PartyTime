class AddEventIdToGuestList < ActiveRecord::Migration
  def change
    add_column :guest_lists, :event_id, :integer
  end
end
