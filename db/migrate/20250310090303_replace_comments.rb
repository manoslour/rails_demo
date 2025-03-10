class ReplaceComments < ActiveRecord::Migration[8.0]
  def change
    drop_table :comments

    create_table :comments do |t|
      t.text :content
      t.references :user
      t.references :commentable, polymorphic: true
      t.boolean :banned, default: false
      t.timestamps
    end
  end
end
