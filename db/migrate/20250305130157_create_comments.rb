class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :post
      t.text :content, null: false
      t.boolean :banned, default: false

      t.timestamps
    end
  end
end
