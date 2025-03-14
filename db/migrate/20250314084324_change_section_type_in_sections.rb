class ChangeSectionTypeInSections < ActiveRecord::Migration[8.0]
  def up
    if column_exists? :sections, :section_type
      remove_column :sections, :section_type, :integer
      add_column :sections, :type, :string, default: 'Section::Default'
    end
  end

  def down
    if column_exists? :sections, :type
      remove_column :sections, :type, :string
      add_column :sections, :section_type, :integer
    end
  end
end
