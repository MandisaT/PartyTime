class AddProductIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :product_id, :integer
  end
end
