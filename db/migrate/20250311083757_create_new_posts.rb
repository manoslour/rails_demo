class CreateNewPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user, null: true, foreign_key: true
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
