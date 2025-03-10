class RemovePosts < ActiveRecord::Migration[8.0]
  def change
    drop_table :taggings
    drop_table :posts
  end
end
