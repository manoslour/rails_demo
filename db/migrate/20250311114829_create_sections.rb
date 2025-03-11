class CreateSections < ActiveRecord::Migration[8.0]
  def change
    create_table :sections do |t|
      t.references :post, null: false, foreign_key: true
      t.integer :section_type
      t.text :content

      t.timestamps
    end
  end
end
