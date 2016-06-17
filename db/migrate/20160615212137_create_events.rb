class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :party_type
      t.string :name
      t.string :adress
      t.string :date

      t.timestamps null: false
    end
  end
end
