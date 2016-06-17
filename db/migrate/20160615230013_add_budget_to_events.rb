class AddBudgetToEvents < ActiveRecord::Migration
  def change
    add_column :events, :budget, :float
  end
end
