class AddIndexToRatings < ActiveRecord::Migration
  def change
  	add_index :ratings, [:user_id, :created_at]
  end
end
