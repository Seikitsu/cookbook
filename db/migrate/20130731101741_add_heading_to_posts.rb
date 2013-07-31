class AddHeadingToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :heading, :string
  end
end
