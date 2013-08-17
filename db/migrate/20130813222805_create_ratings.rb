class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :post_id
      t.decimal :rating, :precision=>10, :scale=>1
      t.timestamps
    end
  end
end
