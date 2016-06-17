class CreateGuestLists < ActiveRecord::Migration
  def change
    create_table :guest_lists do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :extra_guest
      t.string :dietary_type

      t.timestamps null: false
    end
  end
end
