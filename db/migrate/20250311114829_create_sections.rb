class CreateSections < ActiveRecord::Migration[8.0]
  def change
    create_table :sections do |t|
      t.references :post, null: false, foreign_key: true
      t.string :type, default: 'Section::Default'
      t.text :content

      t.timestamps
    end
  end
end
